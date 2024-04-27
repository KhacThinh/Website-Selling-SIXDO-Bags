package com.bags.sixdoBag.config;

import com.bags.sixdoBag.model.entitys.*;
import com.bags.sixdoBag.service.CuaHangService;
import com.lowagie.text.Font;
import com.lowagie.text.Rectangle;
import com.lowagie.text.*;
import com.lowagie.text.pdf.BaseFont;
import com.lowagie.text.pdf.PdfPCell;
import com.lowagie.text.pdf.PdfPTable;
import com.lowagie.text.pdf.PdfWriter;
import lombok.RequiredArgsConstructor;

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

    private CuaHang cuaHang;

    public HoaDonPDFExporter(HoaDon hoaDon, List<ChiTietHoaDon> chiTietHoaDons, CuaHang cuaHangService) {
        this.hoaDon = hoaDon;
        this.chiTietHoaDons = chiTietHoaDons;
        this.cuaHang = cuaHangService;
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

        cell.setPhrase(new Phrase("Màu sắc", font));
        table.addCell(cell);

        cell.setPhrase(new Phrase("Bảo Hành", font));
        table.addCell(cell);

        cell.setPhrase(new Phrase("Số lượng", font));
        table.addCell(cell);

        cell.setPhrase(new Phrase("Đơn giá", font));
        table.addCell(cell);

        cell.setPhrase(new Phrase("Thành tiền", font));
        table.addCell(cell);
    }

    private void writeTableData(PdfPTable table, Font font) {
        int stt = 1;
        Locale localeEN = new Locale("en", "EN");
        NumberFormat en = NumberFormat.getInstance(localeEN);
        for (ChiTietHoaDon chiTietHoaDon : chiTietHoaDons) {
            PdfPCell cell = new PdfPCell();
            cell.setPadding(5);
            cell.setHorizontalAlignment(Element.ALIGN_CENTER);

            SanPham sanPham = chiTietHoaDon.getChiTietSanPham().getSanPham();

            cell.setPhrase(new Phrase(String.valueOf(stt), font));
            table.addCell(cell);

            cell.setPhrase(new Phrase(sanPham.getMaSanPham(), font));
            table.addCell(cell);

            cell.setPhrase(new Phrase(sanPham.getTenSanPham(), font));
            table.addCell(cell);

            MauSac mauSac = chiTietHoaDon.getChiTietSanPham().getMauSac();
            if (Objects.nonNull(mauSac)) {
                cell.setPhrase(new Phrase(mauSac.getTenMauSac(), font));
            } else {
                cell.setPhrase(new Phrase("", font));
            }
            table.addCell(cell);

            ThoiGianBaoHanh thoiGianBaoHanh = sanPham.getThoiGianBaoHanh();
            if (Objects.nonNull(thoiGianBaoHanh)) {
                cell.setPhrase(new Phrase(String.valueOf(thoiGianBaoHanh.getThoiGian()), FontFactory.getFont(FontFactory.TIMES_ROMAN)));
            } else {
                cell.setPhrase(new Phrase(String.valueOf(0), FontFactory.getFont(FontFactory.TIMES_ROMAN)));
            }
            table.addCell(cell);

            cell.setPhrase(new Phrase(String.valueOf(chiTietHoaDon.getSoLuong()), font));
            table.addCell(cell);

            cell.setPhrase(new Phrase(en.format(chiTietHoaDon.getChiTietSanPham().getGiaBan()), font));
            table.addCell(cell);

            cell.setPhrase(new Phrase(en.format(chiTietHoaDon.getGia()), font));
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

        Paragraph p0 = new Paragraph(cuaHang.getTenCuaHang(), fontLogo);
        p0.setAlignment(Paragraph.ALIGN_CENTER);
        p0.setSpacingBefore(20); // Đặt khoảng cách phía trên đoạn văn bản
        document.add(p0);

        String fontPath = "src/main/resources/fonts/Manuale-ExtraBold.ttf";
        BaseFont bf = BaseFont.createFont(fontPath, BaseFont.IDENTITY_H, BaseFont.EMBEDDED);
        Font font = new Font(bf);
        font.setSize(16);

        Paragraph p1 = new Paragraph(cuaHang.getTenDayDuCuaHang(), font);
        p1.setAlignment(Paragraph.ALIGN_CENTER);
        document.add(p1);


        BaseFont bff = BaseFont.createFont("src/main/resources/fonts/Manuale-Regular.ttf", BaseFont.IDENTITY_H, BaseFont.EMBEDDED);
        Font fontNormal = new Font(bff);
        fontNormal.setSize(12);

        Paragraph p2 = new Paragraph("Địa chỉ: " + cuaHang.getDiaChi(), fontNormal);
        p2.setAlignment(Paragraph.ALIGN_CENTER);
        document.add(p2);

        // Thêm các thông tin khác
        Paragraph p3 = new Paragraph("Hotline: " + cuaHang.getSdt(), fontNormal);
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
        if (!hoaDon.getTenNguoiNhan().equals("")) {
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


        PdfPTable table = new PdfPTable(8);
        table.setWidthPercentage(100f);
        table.setWidths(new float[]{1f, 2f, 7f, 2f, 4f, 1.5f, 2.5f, 2.5f});
        table.setSpacingBefore(10);


        writeTableHeader(table);
        writeTableData(table, fontNormal);
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

        Paragraph p11 = new Paragraph("Số tiền thanh toán bằng chữ:   " + convertToVietnameseCurrency(hoaDon.getTongTien().longValue()) + " đồng", fontNormal);
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

        PdfPTable table3 = new PdfPTable(3);
        table3.setWidthPercentage(100f);
        table3.setWidths(new float[]{4f, 4f, 4f});
        table3.setSpacingBefore(15);

        PdfPCell pCelll = new PdfPCell();
        pCelll.setPadding(6);
        pCelll.setBorder(Rectangle.NO_BORDER); // Biên trong suốt
        pCelll.setHorizontalAlignment(Element.ALIGN_CENTER);
        pCelll.setPhrase(new Phrase("", fontXacNhan));
        table3.addCell(pCelll);

        pCelll.setPhrase(new Phrase("", fontXacNhan));
        table3.addCell(pCelll);

        NhanVien nhanVien = hoaDon.getNhanVien();
        if (Objects.nonNull(nhanVien)) {
            pCelll.setPhrase(new Phrase(nhanVien.getHoTen(), fontXacNhan));
        } else {
            pCelll.setPhrase(new Phrase("", fontNormal));
        }
        table3.addCell(pCelll);

        document.add(table3);


        document.close();

        return baos.toByteArray();
    }

    private static final String[] ones = {"", "một", "hai", "ba", "bốn", "năm", "sáu", "bảy", "tám", "chín"};
    private static final String[] tens = {"", "mười", "hai mươi", "ba mươi", "bốn mươi", "năm mươi", "sáu mươi", "bảy mươi", "tám mươi", "chín mươi"};
    private static final String[] groups = {"", "nghìn", "triệu", "tỷ"};

    private static String convertLessThanThousand(long number) {
        String current;

        if (number % 100 < 10) {
            current = ones[(int) (number % 10)];
            number /= 10;
            if (number % 10 == 1) {
                current = "mười " + current;
            } else if (number % 10 != 0) {
                current = ones[(int) (number % 10)] + " mươi " + current;
            }
            number /= 10;
        } else {
            current = ones[(int) (number % 10)];
            number /= 10;
            if (number % 10 != 0) {
                current = tens[(int) (number % 10)] + " " + current;
            } else {
                current = tens[(int) (number % 10)] + current;
            }
            number /= 10;
        }
        if (number == 0) return current;
        return ones[(int) number] + " trăm " + current;
    }

    public static String convertToVietnameseCurrency(long number) {
        if (number == 0) {
            return "không đồng";
        }

        String result = "";
        int group = 0;

        do {
            long n = number % 1000;
            if (n != 0) {
                String s = convertLessThanThousand(n);
                result = s + " " + groups[group] + " " + result;
            }
            group++;
            number /= 1000;
        } while (number > 0);

        return result.trim();
    }

}
