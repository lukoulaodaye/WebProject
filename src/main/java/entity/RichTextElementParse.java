package entity;


@FunctionalInterface
public interface RichTextElementParse{
    RichTextElement parse(String line);
}