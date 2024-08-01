package entity;

import org.jetbrains.annotations.Nullable;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

public abstract class RichTextElement {
    private static List<RichTextElementParse> parsers = new ArrayList<RichTextElementParse>();
    private static Map<Integer, RichTextElement> types = new HashMap<Integer, RichTextElement>();

    public RichTextElement(){

    }
    public abstract String getHtml();

    public String getSaveString() {
        return "";
    }

    public void fromSaveString(String string) {

    }

    public abstract String getRaw();
    public abstract String getIdentifier();
    public abstract String getBrief(int length);
    public abstract int getTypeIdentifier();
    public abstract RichTextElement clear();


    public static void register(RichTextElement sampleElement, RichTextElementParse elementAssert) {
        parsers.add(elementAssert);
        int id = sampleElement.getTypeIdentifier();
        if(types.containsKey(id)) {
            throw new IllegalArgumentException("Id " + id + " already exists");
        }
        types.put(id, sampleElement);
    }

    public static RichTextElement parse(String string) {
        RichTextElement result = null;
        for(RichTextElementParse element : parsers) {
            result = element.parse(string);
            if(result != null) {
                return result;
            }
        }
        return result;
    }

    public static @Nullable RichTextElement getInstance(int id) {
        if(!types.containsKey(id)) {
            return null;
        }
        RichTextElement element = types.get(id);
        types.put(id, element.clear());
        return element;
    }
}
