package cpes.test;

public class Attribute {

	private String type, name;

	public Attribute(String name, String type) {
		this.type = type;
		this.name = name;
	}
	
	public String getType() {
		return type;
	}

	public void setType(String type) {
		this.type = type;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}
	
}
