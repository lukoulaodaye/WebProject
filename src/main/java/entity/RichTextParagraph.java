package entity;

public class RichTextParagraph extends RichTextElement{


    private static boolean registered;
    private String paragraph;

    public RichTextParagraph(String paragraph) {
        this.paragraph = paragraph;
    }

    public String getParagraph() {
        return paragraph;
    }

    public void setParagraph(String paragraph) {
        this.paragraph = paragraph;
    }

    @Override
    public String getSaveString() {
        return paragraph;
    }

    @Override
    public void fromSaveString(String string) {
        this.paragraph = string;
    }

    @Override
    public String getRaw() {
        return getParagraph();
    }

    @Override
    public String getIdentifier() {
        return "p:";
    }

    @Override
    public String getBrief(int length) {
        if(length > paragraph.length()){
            return paragraph;
        }
        return paragraph.substring(length);
    }

    @Override
    public int getTypeIdentifier() {
        return 1;
    }

    @Override
    public RichTextElement clear() {
        return new RichTextParagraph(null);
    }

    @Override
    public String getHtml() {

        return "<p style=\"text-indent: 2em;\">" +
                paragraph +
                "</p>";
    }

    public static void register(){
        if(registered)return;
        RichTextElement.register(new RichTextParagraph(null), line -> {
            if(line.startsWith("p:")){
                RichTextParagraph img = new RichTextParagraph(line.substring(2));
                return img;
            }
            return null;
        });
        registered = true;
    }
}
