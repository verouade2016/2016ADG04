package com.ADG04.bean.Encomienda;


public class DTO_EnvioTercerizado extends DTO_Envio{
	private static final long serialVersionUID = 1L;
	private String numeroTracking;
	private Integer idProveedor;
	
	
	public DTO_EnvioTercerizado(){
		super();
	}


	public String getNumeroTracking() {
		return numeroTracking;
	}


	public void setNumeroTracking(String numeroTracking) {
		this.numeroTracking = numeroTracking;
	}


	public Integer getIdProveedor() {
		return idProveedor;
	}


	public void setIdProveedor(Integer idProveedor) {
		this.idProveedor = idProveedor;
	}


}
