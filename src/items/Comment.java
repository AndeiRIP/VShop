package items;

import java.io.Serializable;

public class Comment implements Serializable {
	private static final long serialVersionUID = 41435931136727801L;
	
	private final String userName;
	private final String comment;

	public Comment(String user, String comment) {
		this.userName = user;
		this.comment = comment;
	}

	public String getUserName() {
		return userName;
	}

	public String getComment() {
		return comment;
	}

}
