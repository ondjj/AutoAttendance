package fileupload;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.InputStream;
import java.io.OutputStream;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.oreilly.servlet.MultipartRequest;

// web.xml에서 최대 용량은 1메가 정도로 기본 세팅작업함
// 파일 업로드시 FileUtil 클래스를 사용하여 업로드 작업 예정
public class FileUtil {
	// 업로드
	public static MultipartRequest uploadFile(HttpServletRequest request, String saveDirectiory, int maxPostSize) {
		try {
			return new MultipartRequest(request, saveDirectiory, maxPostSize, "utf-8");
		} catch (Exception e) {
			System.out.println("파일 업로드 호출 오류");
			e.printStackTrace();
		}
		return null;
	}
	
	// 해당 파일을 찾아 다운로드
	public static void download(HttpServletRequest request, HttpServletResponse response, String directory, String sfileName, String ofileName) {
		
		//파일이 저장된 실제 위치를 가져옴
		String sDirectory = request.getServletContext().getRealPath(directory);
		
		try {
			// 해당 파일을 찾아 입력 스트림 생성함
			File file = new File(sDirectory, sfileName);
			InputStream iStream = new FileInputStream(file);
			
			// 한글 파일 처리
			// 한글 파일이 깨질 경우를 대비하는 구문으로 브라우저 헤더 정보의 user-agent값의 정보를 읽어들어 브라우저 종류를 파악함
			// ms 인터넷 익스플로러 일때하고 나머지 일때 구분하고 한글 파일 처리해줌
			String client = request.getHeader("User-Agent");
			if (client.indexOf("WOW64") == -1) {
				ofileName = new String(ofileName.getBytes("utf-8"), "ISO-8859-1");
			} else {
				ofileName = new String(ofileName.getBytes("ksc5601"), "ISO-8859-1");
			}
			
			// 파일 다운로드용 응답 헤더 설정
			response.reset();
			response.setContentType("application/octet-stream");
			response.setHeader("content-Disposition", "attachment; filename=\"" + ofileName + "\"");
			response.setHeader("Content-Length", "" + file.length());
			
			// 출력 스트림 생성
			OutputStream oStream = response.getOutputStream();
			
			// 출력 스트림에 파일 내용 출력
			byte b[] = new byte[(int)file.length()];
			int readBuffer = 0;
			
			while ((readBuffer = iStream.read(b)) > 0) {
				oStream.write(b, 0, readBuffer);
			}
			// 입출력 스트림 닫기
			iStream.close();
			oStream.close();
			
		} catch (FileNotFoundException e) {
			System.out.println("파일 찾기 오류");
			e.printStackTrace();
			
		} catch (Exception e) {
			System.out.println("파일 다운로드 오류");
			e.printStackTrace();
		}
	}
	
	// 지정한 위치의 파일 삭제
	public static void deleteFile(HttpServletRequest request, String directory, String filename) {
		// 파일이 저장된 실제 위치를 가져옴
		String sDirectory = request.getServletContext().getRealPath(directory);
		
		File file = new File(sDirectory + File.separator + filename);
		if (file.exists()) {
			file.delete();
		}
	}
	
}
