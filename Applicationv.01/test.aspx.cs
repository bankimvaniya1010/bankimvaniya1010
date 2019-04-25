using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Drawing;
using IronPdf;

public partial class test : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        Common objCom = new Common();
        //  string password = objCom.DecodeFrom64("TWgwM2F6NTkzNA==");
       

        var Renderer = new IronPdf.HtmlToPdf();
        var PDF = Renderer.RenderUrlAsPdf("https://en.wikipedia.org/wiki/Portable_Document_Format");
        
        PDF.SaveAs(Server.MapPath("wikipedia.pdf"));

        PdfDocument Pdf = PdfDocument.FromFile(Server.MapPath("wikipedia.pdf"), "Hcom@301");
        //Edit file metadata
        Pdf.MetaData.Author = "The Application Center";
        Pdf.MetaData.Keywords = "SEO, Friendly";
        Pdf.MetaData.ModifiedDate = DateTime.Now;
        //Edit file security settings
        //The following code makes a PDF read only and will disallow copy & paste and printing
        Pdf.SecuritySettings.RemovePasswordsAndEncryption();
        Pdf.SecuritySettings.MakePdfDocumentReadOnly("secret-key");
        Pdf.SecuritySettings.AllowUserAnnotations = false;
        Pdf.SecuritySettings.AllowUserCopyPasteContent = false;
        Pdf.SecuritySettings.AllowUserFormData = false;
        Pdf.SecuritySettings.AllowUserPrinting = PdfDocument.PdfSecuritySettings.PdfPrintSecrity.NoPrint;
        // chnage or set the document ecrpytion password
       // ExistingPdf.Password = "my-password";
        Pdf.SaveAs(Server.MapPath("secured.pdf"));

    }
}