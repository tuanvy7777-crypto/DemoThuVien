package uef.edu.vn.utils;

import jakarta.servlet.http.Part;
import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Path;

public final class FileUploadUtil {
    private FileUploadUtil() {
    }

    public static String saveCoverImage(Part filePart, Path uploadDir) throws IOException {
        if (filePart == null || filePart.getSubmittedFileName() == null || filePart.getSubmittedFileName().isBlank()) {
            return null;
        }
        Files.createDirectories(uploadDir);
        String safeName = Path.of(filePart.getSubmittedFileName()).getFileName().toString();
        Path target = uploadDir.resolve(safeName);
        filePart.write(target.toString());
        return safeName;
    }
}