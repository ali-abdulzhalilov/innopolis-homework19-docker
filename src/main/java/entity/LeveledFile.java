package entity;

public class LeveledFile {
    private int level;
    private String filename;
    private boolean isFolder;

    public LeveledFile(String filename, int level, boolean isFolder) {
        this.level = level;
        this.filename = filename;
        this.isFolder = isFolder;
    }

    public int getLevel() {
        return level;
    }

    public String getFilename() {
        return filename;
    }

    public boolean isFolder() {
        return isFolder;
    }
}
