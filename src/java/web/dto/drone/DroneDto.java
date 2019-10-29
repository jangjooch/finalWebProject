package web.dto.drone;

import org.springframework.stereotype.Component;

@Component
public class DroneDto {
	private int d_number;
	private String d_model;
	private int d_status;
	private int d_weight;
	private int d_battery;
	public int getD_number() {
		return d_number;
	}
	public void setD_number(int d_number) {
		this.d_number = d_number;
	}
	public String getD_model() {
		return d_model;
	}
	public void setD_model(String d_model) {
		this.d_model = d_model;
	}
	public int getD_status() {
		return d_status;
	}
	public void setD_status(int d_status) {
		this.d_status = d_status;
	}
	public int getD_weight() {
		return d_weight;
	}
	public void setD_weight(int d_weight) {
		this.d_weight = d_weight;
	}
	public int getD_battery() {
		return d_battery;
	}
	public void setD_battery(int d_battery) {
		this.d_battery = d_battery;
	}
	
	
	
}
