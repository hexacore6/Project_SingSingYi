package com.hexacore.ssy;

import java.util.Locale;


import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

/**
 * Handles requests for the application home page.
 */
@Controller
@RequestMapping("/game/*")
public class GameController {
	
	private static final Logger logger = LoggerFactory.getLogger(GameController.class);
	
	/**
	 * Simply selects the home view to render by returning its name.
	 */
	@RequestMapping(value = "/jhgame3", method = RequestMethod.GET)
	public void home(Locale locale, Model model) {
		logger.info("Welcome home! The client locale is {}.", locale);

		
	}
	
	/*@RequestMapping("/jhgame")
	public void getImage(HttpServletRequest req, HttpSession session, HttpServletResponse res, 
			@RequestParam HashMap<String, String> map) throws Exception {

		String realFile = "C:\\ㅇㅂ노래\\";
		String fileNm = "mc더맥스onelove.mp3";
		String ext = "mp3";

		BufferedOutputStream out = null;
		InputStream in = null;

		try {
			res.setContentType("audio/" + ext);
			res.setHeader("Content-Disposition", "inline;filename=" + fileNm);
			File file = new File(realFile);
			if(file.exists()){
				in = new FileInputStream(file);
				out = new BufferedOutputStream(res.getOutputStream());
				int len;
				byte[] buf = new byte[1024];
				while ((len = in.read(buf)) > 0) {
					out.write(buf, 0, len);
				}
			}
		} catch (Exception e) {
		} finally {
			if(out != null){ out.flush(); }
			if(out != null){ out.close(); }
			if(in != null){ in.close(); }
		}
	}*/
	
}
