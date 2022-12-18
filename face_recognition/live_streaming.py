from flask import Flask
from flask_cors import CORS, cross_origin
from flask_restful import Api
import face_recog


app = Flask(__name__)
api = Api(app)
CORS(app)

@app.route('/', methods=['GET', 'POST'])
def index():
    face = face_recog.FaceRecog()
    frame = face.get_frame()
    target_name = face.target_name
    print(target_name)

    return "AdminDashBoard.do?data=" + target_name

def __del__(self):
    del self.camera

if __name__ == '__main__':
    
    app.run(host='0.0.0.0',port=5000,debug=True)
            

    

    
    

    
    
    
    
