package uef.edu.vn.utils;

import java.nio.charset.StandardCharsets;
import java.util.List;

public final class ExcelExportUtil {
    private ExcelExportUtil() {
    }

    public static byte[] exportRows(List<String> rows) {
        String csv = "\uFEFF" + String.join("\r\n", rows);
        return csv.getBytes(StandardCharsets.UTF_8);
    }
}
