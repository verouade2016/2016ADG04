package com.ADG04.Servidor.dao;

import javax.persistence.EntityManager;
import javax.persistence.EntityTransaction;
import javax.persistence.Query;

import com.ADG04.Servidor.model.Provincia;
import com.ADG04.Servidor.util.EntityManagerProvider;

import java.lang.reflect.ParameterizedType;
import java.lang.reflect.Type;
import java.util.ArrayList;
import java.util.List;


public class ProvinciaDao extends GenericDao<Provincia, Integer> {

	private static ProvinciaDao instancia;


	private ProvinciaDao(EntityManager entityManager) {
		super(entityManager);
		// TODO Auto-generated constructor stub
	}

	public static ProvinciaDao getInstancia(){
		if(instancia == null){	
			instancia = new ProvinciaDao(EntityManagerProvider.getInstance().getEntityManagerFactory().createEntityManager());
		} 
		return instancia;
	}

	@SuppressWarnings("unchecked")
	public List<Provincia> getByPais(int idPais) {
		try{
		return entityManager.createQuery("from Provincia where pais=:pais")
				            .setParameter("pais", idPais)
				            .getResultList();
		}catch(Exception e){
            System.out.println(e);
            System.out.println("ErrorDAO: Listar provincias");
		}
		return null;
	}

}
