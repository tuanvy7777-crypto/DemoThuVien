package uef.edu.vn.utils;

import java.nio.charset.StandardCharsets;

public final class PdfExportUtil {
    private PdfExportUtil() {
    }

    public static byte[] exportBorrowReceipt(String receiptContent) {
        return exportText("Library report", receiptContent);
    }

    public static byte[] exportText(String title, String content) {
        String text = (title + "\n\n" + content)
                .replace("\\", "\\\\")
                .replace("(", "\\(")
                .replace(")", "\\)")
                .replace("\r", "");
        String stream = "BT /F1 12 Tf 50 780 Td 14 TL (" + text.replace("\n", ") Tj T* (") + ") Tj ET";
        byte[] streamBytes = stream.getBytes(StandardCharsets.US_ASCII);
        String pdf = """
                %PDF-1.4
                1 0 obj << /Type /Catalog /Pages 2 0 R >> endobj
                2 0 obj << /Type /Pages /Kids [3 0 R] /Count 1 >> endobj
                3 0 obj << /Type /Page /Parent 2 0 R /MediaBox [0 0 595 842] /Resources << /Font << /F1 4 0 R >> >> /Contents 5 0 R >> endobj
                4 0 obj << /Type /Font /Subtype /Type1 /BaseFont /Helvetica >> endobj
                5 0 obj << /Length %d >> stream
                %s
                endstream endobj
                trailer << /Root 1 0 R /Size 6 >>
                %%EOF
                """.formatted(streamBytes.length, stream);
        return pdf.getBytes(StandardCharsets.US_ASCII);
    }
}
