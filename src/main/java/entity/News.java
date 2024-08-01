package entity;

import java.text.SimpleDateFormat;
import java.time.Instant;
import java.util.Date;

public class News {
    public static final News placeholder = new News(-1, "", RichText.getEmpty(), Date.from(Instant.now()));

    private int id;
    private String title;
    private RichText content;
    private Date publishDate;

    public News(int id, String title, RichText content, Date publishDate) {
        this.id = id;
        this.title = title;
        this.content = content;
        this.publishDate = publishDate;
    }

    public int getId() {
        return id;
    }

    public String getTitle() {
        return title;
    }

    public String getTitleBrief(int length){
        if(title.length() <= length){
            return title;
        }
        return title.substring(0, length) + "...";
    }

    public String getContent() {
        return content.getHtml();
    }

    public RichText getRichText(){
        return content;
    }

    public Date getPublishDate() {
        return publishDate;
    }

    public String getBrief(){
        return getBrief(20);
    }

    public String getBrief(int length){
        return content.getBrief(length) + "...";
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getFormattedDateStr(String format){
        SimpleDateFormat sdf = new SimpleDateFormat(format);
        return sdf.format(publishDate);
    }

    public String getDateControlStr(){
        SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd'T'HH:mm");
        return sdf.format(publishDate);
    }
}
