package com.bags.sixdoBag.config;

import com.bags.sixdoBag.model.entitys.ChiTietHoaDon;
import com.bags.sixdoBag.model.entitys.HoaDon;
import com.lowagie.text.Font;
import com.lowagie.text.Rectangle;
import com.lowagie.text.*;
import com.lowagie.text.pdf.BaseFont;
import com.lowagie.text.pdf.PdfPCell;
import com.lowagie.text.pdf.PdfPTable;
import com.lowagie.text.pdf.PdfWriter;

import java.awt.*;
import java.io.ByteArrayOutputStream;
import java.io.IOException;
import java.text.NumberFormat;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.List;
import java.util.Locale;
import java.util.Objects;

public class HoaDonPDFExporter {

    private HoaDon hoaDon;

    private List<ChiTietHoaDon> chiTietHoaDons;

    public HoaDonPDFExporter(HoaDon hoaDon, List<ChiTietHoaDon> chiTietHoaDons) {
        this.hoaDon = hoaDon;
        this.chiTietHoaDons = chiTietHoaDons;
    }

    private void writeTableHeader(PdfPTable table) throws DocumentException, IOException {
        PdfPCell cell = new PdfPCell();
        cell.setPadding(6);
        cell.setHorizontalAlignment(Element.ALIGN_CENTER); // Căn giữa nội dung của ô

        String fontPath = "src/main/resources/fonts/Manuale-SemiBold.ttf";
        BaseFont bf = BaseFont.createFont(fontPath, BaseFont.IDENTITY_H, BaseFont.EMBEDDED);
        Font font = new Font(bf);
        font.setColor(Color.BLACK);

        cell.setPhrase(new Phrase("STT", font));
        table.addCell(cell);

        cell.setPhrase(new Phrase("Mã sản phẩm", font));
        table.addCell(cell);

        cell.setPhrase(new Phrase("Tên sản phẩm", font));
        table.addCell(cell);

        cell.setPhrase(new Phrase("Bảo hành", font));
        table.addCell(cell);

        cell.setPhrase(new Phrase("Số lượng", font));
        table.addCell(cell);

        cell.setPhrase(new Phrase("Đơn giá", font));
        table.addCell(cell);

        cell.setPhrase(new Phrase("Thành tiền", font));
        table.addCell(cell);
    }

    private void writeTableData(PdfPTable table) {
        int stt = 1;
        Locale localeEN = new Locale("en", "EN");
        NumberFormat en = NumberFormat.getInstance(localeEN);
        for (ChiTietHoaDon chiTietHoaDon : chiTietHoaDons) {
            PdfPCell cell = new PdfPCell();
            cell.setPadding(5);
            cell.setHorizontalAlignment(Element.ALIGN_CENTER);

            cell.setPhrase(new Phrase(String.valueOf(stt), FontFactory.getFont(FontFactory.TIMES_ROMAN)));
            table.addCell(cell);

            cell.setPhrase(new Phrase(chiTietHoaDon.getChiTietSanPham().getSanPham().getMaSanPham(), FontFactory.getFont(FontFactory.TIMES_ROMAN))); // Font căn giữa
            table.addCell(cell);

            cell.setPhrase(new Phrase(chiTietHoaDon.getChiTietSanPham().getSanPham().getTenSanPham(), FontFactory.getFont(FontFactory.TIMES_ROMAN))); // Font căn giữa
            table.addCell(cell);

            if (Objects.nonNull(chiTietHoaDon.getChiTietSanPham().getSanPham().getThoiGianBaoHanh())) {
                cell.setPhrase(new Phrase(String.valueOf(chiTietHoaDon.getChiTietSanPham().getSanPham().getThoiGianBaoHanh().getThoiGian()), FontFactory.getFont(FontFactory.TIMES_ROMAN))); // Font căn giữa
            } else {
                cell.setPhrase(new Phrase("", FontFactory.getFont(FontFactory.TIMES_ROMAN)));
            }
            table.addCell(cell);

            cell.setPhrase(new Phrase(String.valueOf(chiTietHoaDon.getSoLuong()), FontFactory.getFont(FontFactory.TIMES_ROMAN)));
            table.addCell(cell);

            cell.setPhrase(new Phrase(en.format(chiTietHoaDon.getChiTietSanPham().getGiaBan()), FontFactory.getFont(FontFactory.TIMES_ROMAN)));
            table.addCell(cell);

            cell.setPhrase(new Phrase(en.format(chiTietHoaDon.getGia()), FontFactory.getFont(FontFactory.TIMES_ROMAN)));
            table.addCell(cell);

            stt++;
        }
    }


    public byte[] export() throws DocumentException, IOException {
        Document document = new Document(PageSize.A4.rotate());
        ByteArrayOutputStream baos = new ByteArrayOutputStream();
        PdfWriter.getInstance(document, baos);

        document.open();


        BaseFont bsf = BaseFont.createFont("src/main/resources/fonts/RubikGlitchPop-Regular.ttf", BaseFont.IDENTITY_H, BaseFont.EMBEDDED);
        Font fontLogo = new Font(bsf);
        fontLogo.setSize(30);

        Paragraph p0 = new Paragraph("SIXDO", fontLogo);
        p0.setAlignment(Paragraph.ALIGN_CENTER);
        document.add(p0);

//        Font fontArial = FontFactory.getFont("/fonts/Arial.ttf", BaseFont.IDENTITY_H, BaseFont.EMBEDDED, 18);
        String fontPath = "src/main/resources/fonts/Manuale-ExtraBold.ttf";
        BaseFont bf = BaseFont.createFont(fontPath, BaseFont.IDENTITY_H, BaseFont.EMBEDDED);
        Font font = new Font(bf);
        font.setSize(16);


//        Font font = FontFactory.getFont("Arial Unicode MS", BaseFont.IDENTITY_H, BaseFont.EMBEDDED, 18);
//        Font font = FontFactory.getFont(FontFactory.TIMES_ROMAN, 18); // Use a Vietnamese-friendly font and encoding

        Paragraph p1 = new Paragraph("CỬA HÀNG TÚI XÁCH SIXDO", font);
        p1.setAlignment(Paragraph.ALIGN_CENTER);
        document.add(p1);


        BaseFont bff = BaseFont.createFont("src/main/resources/fonts/Manuale-Regular.ttf", BaseFont.IDENTITY_H, BaseFont.EMBEDDED);
        Font fontNormal = new Font(bff);
        fontNormal.setSize(12);
//        Font fontNormal = FontFactory.getFont(FontFactory.TIMES_ROMAN, 12);
        Paragraph p2 = new Paragraph("Địa chỉ: số 24 Hai Bà Trưng, Quận Hoàn Kiếm, Thành Phố Hà Nội", fontNormal);
        p2.setAlignment(Paragraph.ALIGN_CENTER);
        document.add(p2);

        // Thêm các thông tin khác
        Paragraph p3 = new Paragraph("Hotline: 0963828374", fontNormal);
        p3.setAlignment(Paragraph.ALIGN_CENTER);
        document.add(p3);
        p3.setSpacingAfter(30);

        BaseFont bfff = BaseFont.createFont("src/main/resources/fonts/Manuale-SemiBold.ttf", BaseFont.IDENTITY_H, BaseFont.EMBEDDED);
        Font font1 = new Font(bfff);
        font1.setSize(15);
        Paragraph p4 = new Paragraph("HOÁ ĐƠN BÁN HÀNG", font1);
        p4.setAlignment(Paragraph.ALIGN_CENTER);
        p4.setSpacingBefore(10);
        document.add(p4);

        Paragraph p5 = new Paragraph("Số hóa đơn: " + hoaDon.getMaHoaDon(), fontNormal);
        p5.setAlignment(Paragraph.ALIGN_CENTER);
        document.add(p5);

        LocalDateTime ngayTao = hoaDon.getThoiGianTao();
        DateTimeFormatter formatter = DateTimeFormatter.ofPattern("HH:mm, 'Ngày' dd 'Tháng' MM 'Năm' yyyy", new Locale("vi", "VN"));
        String ngayTaoFormatted = ngayTao.format(formatter);

        Paragraph p6 = new Paragraph(ngayTaoFormatted, fontNormal);
        p6.setAlignment(Paragraph.ALIGN_CENTER);
        p6.setSpacingAfter(10);
        document.add(p6);


        // Thêm các thông tin khách hàng
        Paragraph p7 = null;
        if (Objects.nonNull(hoaDon.getTenNguoiNhan())) {
            p7 = new Paragraph("Khách hàng: " + hoaDon.getTenNguoiNhan(), fontNormal);
        } else {
            p7 = new Paragraph("Khách hàng: Khách lẻ", fontNormal);
        }
        p7.setAlignment(Paragraph.ALIGN_LEFT);
        document.add(p7);

        Paragraph p8 = new Paragraph("SĐT: " + hoaDon.getSdtNguoiNhan(), fontNormal);
        p8.setAlignment(Paragraph.ALIGN_LEFT);
        document.add(p8);

        Paragraph p9 = null;
        if (Objects.nonNull(hoaDon.getDiaChiNguoiNhan())) {
            p9 = new Paragraph("Địa chỉ:" + hoaDon.getDiaChiNguoiNhan(), fontNormal);
        } else {
            p9 = new Paragraph("Địa chỉ: -- --", fontNormal);
        }
        p9.setAlignment(Paragraph.ALIGN_LEFT);
        p9.setSpacingAfter(20);
        document.add(p9);


        PdfPTable table = new PdfPTable(7);
        table.setWidthPercentage(100f);
        table.setWidths(new float[]{1f, 2f, 4f, 1.5f, 1.5f, 3.5f, 3.5f});
        table.setSpacingBefore(10);


        writeTableHeader(table);
        writeTableData(table);
        document.add(table);

        Locale localeEN = new Locale("en", "EN");
        NumberFormat en = NumberFormat.getInstance(localeEN);

        PdfPTable table1 = new PdfPTable(3);
        table1.setWidthPercentage(100f);
        table1.setWidths(new float[]{4f, 4f, 4f});
        table1.setSpacingBefore(20); // Cách top là 20

        PdfPCell celll = new PdfPCell();
        celll.setPadding(6);
        celll.setBorder(Rectangle.NO_BORDER); // Biên trong suốt
        celll.setHorizontalAlignment(Element.ALIGN_CENTER);
        celll.setPhrase(new Phrase("Tổng cộng: ", fontNormal));

        table1.addCell(celll);

        celll.setPhrase(new Phrase(String.valueOf(chiTietHoaDons.size()), fontNormal));
        table1.addCell(celll);

        celll.setPhrase(new Phrase(en.format(hoaDon.getTongTien()), fontNormal));
        table1.addCell(celll);

        document.add(table1);

        Paragraph p11 = new Paragraph("Tổng tiền thanh toán bằng chữ:  " + convertToVietnameseCurrency(hoaDon.getTongTien().longValue()), fontNormal);
        p11.setAlignment(Paragraph.ALIGN_RIGHT);
        p11.setSpacingBefore(10);
        document.add(p11);


        BaseFont baf = BaseFont.createFont("src/main/resources/fonts/Manuale-SemiBold.ttf", BaseFont.IDENTITY_H, BaseFont.EMBEDDED);
        Font fontXacNhan = new Font(baf);
        PdfPTable table2 = new PdfPTable(3);
        table2.setWidthPercentage(100f);
        table2.setWidths(new float[]{4f, 4f, 4f});
        table2.setSpacingBefore(15);

        PdfPCell pCell = new PdfPCell();
        pCell.setPadding(6);
        pCell.setBorder(Rectangle.NO_BORDER); // Biên trong suốt
        pCell.setHorizontalAlignment(Element.ALIGN_CENTER);
        pCell.setPhrase(new Phrase("Người nhận", fontXacNhan));
        table2.addCell(pCell);

        pCell.setPhrase(new Phrase("Người giao", fontXacNhan));
        table2.addCell(pCell);

        pCell.setPhrase(new Phrase("Người lập", fontXacNhan));
        table2.addCell(pCell);

        document.add(table2);


        document.close();

        return baos.toByteArray();
    }

    private static final String[] NUMBERS = {"không", "một", "hai", "ba", "bốn", "năm", "sáu", "bảy", "tám", "chín"};
    private static final String[] UNITS = {"", "nghìn", "triệu", "tỷ"};
    private static final String[] TEENS = {"mười", "mười một", "mười hai", "mười ba", "mười bốn", "mười lăm", "mười sáu", "mười bảy", "mười tám", "mười chín"};

    public static String convertToVietnameseCurrency(Long amount) {
        if (amount == 0) {
            return "không đồng";
        }

        String strAmount = String.valueOf(amount);
        String[] parts = strAmount.split("\\.");
        String result = "";

        // Xử lý phần nguyên
        int integerPart = Integer.parseInt(parts[0]);
        int index = 0;
        while (integerPart > 0) {
            int group = integerPart % 1000;
            integerPart /= 1000;

            if (group > 0) {
                result = convertGroupToVietnamese(group) + " " + UNITS[index] + " " + result;
            }

            index++;
        }

        // Xử lý phần thập phân
        if (parts.length == 2 && Integer.parseInt(parts[1]) > 0) {
            result += " phẩy";
            String decimalPart = parts[1].substring(0, Math.min(parts[1].length(), 2));
            for (char c : decimalPart.toCharArray()) {
                result += " " + NUMBERS[Character.getNumericValue(c)];
            }
        }

        return result.trim();
    }

    private static String convertGroupToVietnamese(int group) {
        String result = "";

        int hundreds = group / 100;
        int tens = (group % 100) / 10;
        int ones = group % 10;

        if (hundreds > 0) {
            result += NUMBERS[hundreds] + " trăm ";
        }

        if (tens == 0 && ones > 0) {
            result += "lẻ ";
        } else if (tens == 1) {
            result += TEENS[ones] + " ";
        } else if (tens > 1) {
            result += TEENS[tens] + " ";
            if (ones > 0) {
                result += NUMBERS[ones] + " ";
            }
        }

        if (tens != 1 && ones > 0) {
            result += NUMBERS[ones] + " ";
        }

        return result;
    }

}
