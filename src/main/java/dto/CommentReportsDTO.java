package dto;

public class CommentReportsDTO {
	 private int report_id;
	    private int comment_number;
	    private int reporter_id;
	    private String report_reason;
	    private String report_status;
	    private String report_time; // 시간 필드: String 타입
	    private int handled_by;
	    private String handled_time; // 시간 필드: String 타입

	    // 기본 생성자
	    public CommentReportsDTO() {
	    }

	    // 필드 초기화 생성자
	    public CommentReportsDTO(int report_id, int comment_number, int reporter_id, String report_reason, String report_status,
	                          String report_time, int handled_by, String handled_time) {
	        this.report_id = report_id;
	        this.comment_number = comment_number;
	        this.reporter_id = reporter_id;
	        this.report_reason = report_reason;
	        this.report_status = report_status;
	        this.report_time = report_time;
	        this.handled_by = handled_by;
	        this.handled_time = handled_time;
	    }

	    // Getter 및 Setter
	    public int getReport_id() {
	        return report_id;
	    }

	    public void setReport_id(int report_id) {
	        this.report_id = report_id;
	    }

	    public int getComment_number() {
	        return comment_number;
	    }

	    public void setComment_number(int comment_number) {
	        this.comment_number = comment_number;
	    }

	    public int getReporter_id() {
	        return reporter_id;
	    }

	    public void setReporter_id(int reporter_id) {
	        this.reporter_id = reporter_id;
	    }

	    public String getReport_reason() {
	        return report_reason;
	    }

	    public void setReport_reason(String report_reason) {
	        this.report_reason = report_reason;
	    }

	    public String getReport_status() {
	        return report_status;
	    }

	    public void setReport_status(String report_status) {
	        this.report_status = report_status;
	    }

	    public String getReport_time() {
	        return report_time;
	    }

	    public void setReport_time(String report_time) {
	        this.report_time = report_time;
	    }

	    public int getHandled_by() {
	        return handled_by;
	    }

	    public void setHandled_by(int handled_by) {
	        this.handled_by = handled_by;
	    }

	    public String getHandled_time() {
	        return handled_time;
	    }

	    public void setHandled_time(String handled_time) {
	        this.handled_time = handled_time;
	    }

	    @Override
	    public String toString() {
	        return "CommentReports [report_id=" + report_id + ", comment_number=" + comment_number + ", reporter_id="
	                + reporter_id + ", report_reason=" + report_reason + ", report_status=" + report_status
	                + ", report_time=" + report_time + ", handled_by=" + handled_by + ", handled_time=" + handled_time + "]";
	    }
	}