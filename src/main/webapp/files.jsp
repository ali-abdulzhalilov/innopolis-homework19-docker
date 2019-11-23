<%@ page contentType="text/html" pageEncoding="UTF-8" %>
<%@ page import="java.util.List" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="entity.LeveledFile" %>
<html>
    <head>
        <title>Here all your files</title>

        <link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
        <link rel="stylesheet" href="../css/style.css" />
    </head>
    <body>
        <h2>Files!</h2>
<% List<LeveledFile> files = (ArrayList<LeveledFile>) request.getAttribute("files");

    for (LeveledFile file : files) {
        out.println("\t\t<div class=\"file level-"+file.getLevel()+"\">");

        out.println("\t\t\t<i class=\"material-icons\">"+(file.isFolder()?"folder":"insert_drive_file")+"</i>");
        out.println("\t\t\t<p>"+file.getFilename()+"</p>");

        out.println("\t\t</div>");
    }

%>
    </body>
</html>
