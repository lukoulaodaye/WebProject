package entity;

import java.util.ArrayList;
import java.util.List;

public class RichText extends RichTextElement {
    private int id;
    private List<RichTextElement> elements;
    private static final RichText empty = new RichText(-1);

    public RichText(int id) {
        this.id = id;
        elements = new ArrayList<RichTextElement>();
    }

    public int getId() {
        return id;
    }

    public void addElement(RichTextElement element) throws IllegalAccessException {
        if (id == -1) {
            throw new IllegalAccessException("This is a reserved empty object.");
        }
        elements.add(element);
    }

    public boolean removeElement(RichTextElement element) throws IllegalAccessException {
        if (id == -1) {
            throw new IllegalAccessException("This is a reserved empty object.");
        }
        return elements.remove(element);
    }

    public List<RichTextElement> getAllElements() {
        return elements;
    }

    public void fromFormatString(String formatString) throws IllegalAccessException {
        if (id == -1) {
            throw new IllegalAccessException("This is a reserved empty object.");
        }
        elements.clear();
        String[] lines = formatString.split("\r\n");
        for (String line : lines) {
            RichTextElement e = RichTextElement.parse(line);
            if (e != null)
                elements.add(e);
        }
    }

    public String toFormatString() throws IllegalAccessException {
        if (id == -1) {
            throw new IllegalAccessException("This is a reserved empty object.");
        }
        StringBuilder sb = new StringBuilder();
        for (RichTextElement e : elements) {
            sb.append(e.getIdentifier());
            sb.append(e.getRaw());
            sb.append("\r\n");
        }

        return sb.toString();
    }

    public String getHtml() {
        StringBuilder sb = new StringBuilder();
        for (RichTextElement element : elements) {
            sb.append(element.getHtml());
            sb.append("\n");
        }

        return sb.toString();
    }

    @Override
    public String getRaw() {
        return "";
    }

    @Override
    public String getIdentifier() {
        return "";
    }

    public String getBrief(int length) {
        StringBuilder sb = new StringBuilder();
        for (RichTextElement element : elements) {
            if (sb.length() >= length) break;
            sb.append(element.getBrief(Integer.MAX_VALUE));
        }
        sb.setLength(length);
        return sb.toString();
    }

    @Override
    public int getTypeIdentifier() {
        return 0;
    }

    @Override
    public RichTextElement clear() {
        return empty;
    }

    public static RichText getEmpty() {
        return empty;
    }
}
