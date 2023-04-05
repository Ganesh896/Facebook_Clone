
package com.tech.blog.entities;

/**
 *
 * @author Dell
 */
public class Post {
    private int pid;
    private String pdescription;
    private String photo;
    private int cid;
    private int uid;
    private String postDate;

    public Post(int pid, String pdescription, String photo, int cid, int uid, String postDate) {
        this.pid = pid;
        this.pdescription = pdescription;
        this.photo = photo;
        this.cid = cid;
        this.uid = uid;
        this.postDate = postDate;
    }

    public Post(String pdescription, String photo, int cid, int uid, String postDate) {
        this.pdescription = pdescription;
        this.photo = photo;
        this.cid = cid;
        this.uid = uid;
        this.postDate = postDate;
    }

    public int getPid() {
        return pid;
    }

    public void setPid(int pid) {
        this.pid = pid;
    }

    public String getPdescription() {
        return pdescription;
    }

    public void setPdescription(String pdescription) {
        this.pdescription = pdescription;
    }

    public String getPhoto() {
        return photo;
    }

    public void setPhoto(String photo) {
        this.photo = photo;
    }

    public int getCid() {
        return cid;
    }

    public void setCid(int cid) {
        this.cid = cid;
    }
    
    public int getUid() {
        return uid;
    }

    public void setUid(int uid) {
        this.uid = uid;
    }

    public String getPostDate() {
        return postDate;
    }

    public void setPostDate(String postDate) {
        this.postDate = postDate;
    }
    
}
