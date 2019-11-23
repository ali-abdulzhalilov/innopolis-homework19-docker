import entity.LeveledFile;

import javax.ejb.Local;
import java.util.List;

@Local
public interface GetFilesEjbLocal {
    List<LeveledFile> getFileStructure();
}
