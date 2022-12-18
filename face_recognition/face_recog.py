# face_recog.py
import face_recognition
import cv2
import camera
import os
import numpy as np
from flask import jsonify, request
import time

class FaceRecog():

    target_name = "unknown"
    face_found = False
    
    def __init__(self):
        
        # Using OpenCV to capture from device 0. If you have trouble capturing
        # from a webcam, comment the line below out and use a video file
        # instead.  
        self.camera = camera.VideoCamera()

        self.known_face_encodings = []
        self.known_face_names = []
        
        # 샘플 사진을 불러와 인식을 시작
        dirname = 'knowns'
        files = os.listdir(dirname)
        for filename in files:
            name, ext = os.path.splitext(filename)
            if ext == '.jpg':
                
                self.known_face_names.append(name)
                pathname = os.path.join(dirname, filename)
                img = face_recognition.load_image_file(pathname)
                face_encoding = face_recognition.face_encodings(img)[0]
                self.known_face_encodings.append(face_encoding)

        # 변수 초기화
        self.face_locations = []
        self.face_encodings = []
        self.face_names = []
        
        
        self.process_this_frame = True

    def __del__(self):
        del self.camera
        
    
    def get_frame(self):
        # 싱글 프레임 설정

        frame = self.camera.get_frame()
        
        # 프레임 사이즈를 1/4로 조절 -> 속도 향상
        small_frame = cv2.resize(frame, (0, 0), fx=0.25, fy=0.25)

        # BGR 색상에서 RGB로 변경 (openCV -> face_recognition)
        rgb_small_frame = small_frame[:, :, ::-1]

        # Only process every other frame of video to save time
        if self.process_this_frame:
            # 재생되는 video를 통해 인코딩된 얼굴을 img 파일에서 찾음
            self.face_locations = face_recognition.face_locations(rgb_small_frame)
            self.face_encodings = face_recognition.face_encodings(rgb_small_frame, self.face_locations)

            self.face_names = []
            for face_encoding in self.face_encodings:

                # See if the face is a match for the known face(s)
                distances = face_recognition.face_distance(self.known_face_encodings, face_encoding)
                min_value = min(distances)
                
                # tolerance: How much distance between faces to consider it a match. Lower is more strict.
                # 0.6 is typical best performance.
                name = "Unknown"

                if min_value < 0.6:
                    index = np.argmin(distances)
                    name = self.known_face_names[index]
                    self.face_found = True
                
                self.face_names.append(name)
                self.target_name = name
               
                # print(self.target_name)

        self.process_this_frame = not self.process_this_frame

        # Display the results
        for (top, right, bottom, left), name in zip(self.face_locations, self.face_names):
            # Scale back up face locations since the frame we detected in was scaled to 1/4 size
            top *= 4
            right *= 4
            bottom *= 4
            left *= 4

            # Draw a box around the face
            cv2.rectangle(frame, (left, top), (right, bottom), (0, 0, 255), 2)

            # Draw a label with a name below the face
            cv2.rectangle(frame, (left, bottom - 35), (right, bottom), (0, 0, 255), cv2.FILLED)
            font = cv2.FONT_HERSHEY_DUPLEX
            cv2.putText(frame, name, (left + 6, bottom - 6), font, 1.0, (255, 255, 255), 1)

        return frame

    def get_name(self):
       
        result = {
            "face_found_in_video" : self.target_name,
            "is_target" : self.face_found
        }
        return jsonify(result)

    def get_jpg_bytes(self):
       
        frame = self.get_frame()
        # We are using Motion JPEG, but OpenCV defaults to capture raw images,
        # so we must encode it into JPEG in order to correctly display the
        # video stream.
        ret, jpg = cv2.imencode('.jpg', frame)
        return jpg.tobytes()

    def close(self):
        
        cv2.destroyAllWindows()

if __name__ == '__main__':
    face_recog = FaceRecog()

    while True:

        frame = face_recog.get_frame()

        # show the frame
        cv2.imshow("Frame", frame)
        key = cv2.waitKey(1) & 0xFF

        # cv2.waitKey(10000)
        # print(face_recog.face_names)
        # target_name = face_recog.face_names
        # break

        # if the `q` key was pressed, break from the loop
        if key == ord("q"):
            # print(face_recog.face_names)
            break

    # do a bit of cleanup
    cv2.destroyAllWindows()


