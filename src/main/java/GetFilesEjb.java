import entity.LeveledFile;

import javax.ejb.Stateless;
import java.io.File;
import java.util.ArrayList;
import java.util.List;

@Stateless
public class GetFilesEjb implements GetFilesEjbLocal {
    @Override
    public List<LeveledFile> getFileStructure() {
        return getStructure(new File("."), 0);
    }

    private List<LeveledFile> getStructure(final File file, int level) {
        ArrayList<LeveledFile> result = new ArrayList<>();
        result.add(new LeveledFile(file.getName(), level, file.isDirectory()));

        if (file.isDirectory())
            for (File someFile : file.listFiles())
                result.addAll(getStructure(someFile, level + 1));

        return result;
    }
}
