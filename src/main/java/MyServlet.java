import entity.LeveledFile;

import javax.ejb.EJB;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

@WebServlet(urlPatterns = "/directories")
public class MyServlet extends HttpServlet {

    @EJB(beanName = "GetFilesEjb")
    private GetFilesEjbLocal getFilesBean;

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        List<LeveledFile> files = getFilesBean.getFileStructure();

        request.setAttribute("files", files);
        request.getRequestDispatcher("files.jsp").forward(request, response);
    }
}
