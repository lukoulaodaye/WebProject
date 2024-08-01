package entity;

public class RichTextImage extends RichTextElement {

    private static boolean registered = false;
    private String url;

    public RichTextImage(String url) {
        this.url = url;
    }

    public String getUrl() {
        return url;
    }

    public void setUrl(String url) {
        this.url = url;
    }

    @Override
    public String getSaveString() {
        return url;
    }

    @Override
    public void fromSaveString(String string) {
        url = string;
    }

    @Override
    public String getRaw() {
        return getUrl();
    }

    @Override
    public String getIdentifier() {
        return "img:";
    }

    @Override
    public String getBrief(int length) {
        String brief = "[图片]";
        if (brief.length() < length) {
            return brief;
        }
        return " ";
    }

    @Override
    public int getTypeIdentifier() {
        return 2;
    }

    @Override
    public RichTextElement clear() {
        return new RichTextImage(null);
    }

    @Override
    public String getHtml() {
        return "<img src=\"" + url + "\"/>";
    }


    public static void register() {
        if (registered) return;
        RichTextElement.register(new RichTextImage(null), (line -> {
            if (line.startsWith("img:")) {
                RichTextImage img = new RichTextImage(line.substring(4));
                return img;
            }
            return null;
        }));
        registered = true;
    }
}
