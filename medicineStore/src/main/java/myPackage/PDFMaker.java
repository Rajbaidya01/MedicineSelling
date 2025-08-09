package myPackage;

import java.io.IOException;
import java.io.OutputStream;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;

import com.itextpdf.text.*;
import com.itextpdf.text.pdf.*;

@WebServlet("/PDFMaker")
public class PDFMaker extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        response.setContentType("application/pdf");
        response.setHeader("Content-Disposition", "attachment; filename=\"bills.pdf\"");

        try (OutputStream out = response.getOutputStream()) {
            Document document = new Document();
            PdfWriter.getInstance(document, out);
            document.open();

            // Title
            Font titleFont = FontFactory.getFont(FontFactory.HELVETICA_BOLD, 18, new BaseColor(46, 125, 50)); // #2e7d32
            Paragraph title = new Paragraph("Medicine Purchase Summary", titleFont);
            title.setAlignment(Element.ALIGN_CENTER);
            document.add(title);
            document.add(Chunk.NEWLINE);
            
            // Define fonts
            Font labelFont = FontFactory.getFont(FontFactory.HELVETICA_BOLD, 12, BaseColor.BLACK);
            Font valueFont = FontFactory.getFont(FontFactory.HELVETICA, 12, BaseColor.DARK_GRAY);

            // Customer details with styling
            Paragraph customerDetails = new Paragraph();
            
            String customerName = request.getParameter("name");
            String customerAddress = request.getParameter("address");
            String customerPhone = request.getParameter("phno");
            String totalAmount = request.getParameter("totalAmount");
            
            customerDetails.setSpacingAfter(10f);  // Space after the section
            customerDetails.setSpacingBefore(10f); // Space before the section

            customerDetails.add(new Phrase("Customer Name: ", labelFont));
            customerDetails.add(new Phrase(customerName + "\n", valueFont));

            customerDetails.add(new Phrase("Address: ", labelFont));
            customerDetails.add(new Phrase(customerAddress + "\n", valueFont));

            customerDetails.add(new Phrase("Phone Number: ", labelFont));
            customerDetails.add(new Phrase(customerPhone + "\n", valueFont));

            customerDetails.add(new Phrase("Total Amount: ₹", labelFont));
            customerDetails.add(new Phrase(totalAmount + "\n", valueFont));

            // Add to document
            document.add(customerDetails);

            // Extra space before table
            document.add(Chunk.NEWLINE);


            // Create a table with 3 columns
            PdfPTable table = new PdfPTable(3);
            table.setWidthPercentage(100);
            table.setWidths(new float[]{4, 2, 3});
            table.setSpacingBefore(10f);
            table.setSpacingAfter(10f);

            // Header style
            Font headerFont = FontFactory.getFont(FontFactory.HELVETICA_BOLD, 12, BaseColor.WHITE);
            BaseColor headerColor = new BaseColor(46, 125, 50);  // #2e7d32 green

            String[] headers = {"Medicine Name", "Units", "Amount"};
            for (String header : headers) {
                PdfPCell headerCell = new PdfPCell(new Phrase(header, headerFont));
                headerCell.setBackgroundColor(headerColor);
                headerCell.setHorizontalAlignment(Element.ALIGN_CENTER);
                headerCell.setVerticalAlignment(Element.ALIGN_MIDDLE);
                headerCell.setPaddingTop(10);
                headerCell.setPaddingBottom(10);
                table.addCell(headerCell);
            }

            // Get all medicine entries from request
            String[] names = request.getParameterValues("medicineName");
            String[] units = request.getParameterValues("units");
            String[] amounts = request.getParameterValues("amount");

            Font dataFont = FontFactory.getFont(FontFactory.HELVETICA, 11, BaseColor.BLACK);
            BaseColor rowColor = new BaseColor(248, 255, 248); // very light green background for rows

            if (names != null && units != null && amounts != null) {
                for (int i = 0; i < names.length; i++) {
                    PdfPCell nameCell = new PdfPCell(new Phrase(names[i], dataFont));
                    nameCell.setPadding(8);
                    nameCell.setBackgroundColor(rowColor);
                    table.addCell(nameCell);

                    PdfPCell unitsCell = new PdfPCell(new Phrase(units[i], dataFont));
                    unitsCell.setHorizontalAlignment(Element.ALIGN_CENTER);
                    unitsCell.setPadding(8);
                    unitsCell.setBackgroundColor(rowColor);
                    table.addCell(unitsCell);

                    PdfPCell amountCell = new PdfPCell(new Phrase("₹" + amounts[i], dataFont));
                    amountCell.setHorizontalAlignment(Element.ALIGN_RIGHT);
                    amountCell.setPadding(8);
                    amountCell.setBackgroundColor(rowColor);
                    table.addCell(amountCell);
                }
            } else {
                PdfPCell noDataCell = new PdfPCell(new Phrase("No data received.", dataFont));
                noDataCell.setColspan(3);
                noDataCell.setHorizontalAlignment(Element.ALIGN_CENTER);
                noDataCell.setPadding(10);
                table.addCell(noDataCell);
            }

            document.add(table);

            // Footer note
            document.add(Chunk.NEWLINE);
            Font noteFont = FontFactory.getFont(FontFactory.HELVETICA_OBLIQUE, 10, new BaseColor(120, 120, 120));
            Paragraph note = new Paragraph("Generated by Medicine Purchase System", noteFont);
            note.setAlignment(Element.ALIGN_RIGHT);
            document.add(note);

            document.close();
        } catch (DocumentException e) {
            e.printStackTrace();
        }
    }
}
