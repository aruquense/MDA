package modelo;

public class Usuario {
    private Long id;
    private int nVentas, nVisitas,nValoraciones;
    private String nombre, correo, contrasena,localizacion;
    private Double valoracion;
    private Integer[] idpedidos;
    private boolean espremium;

    public Usuario(Long id, int nVentas, int nVisitas,String localizacion, String nombre, String correo, String contrasena, Double valoracion, Integer[] idpedidos, int espremium, int nValoraciones) {
        this.id = id;
        this.nVentas = nVentas;
        this.nVisitas = nVisitas;
        this.localizacion = localizacion;
        this.nombre = nombre;
        this.correo = correo;
        this.contrasena = contrasena;
        this.valoracion = valoracion;
        this.idpedidos = idpedidos;
        this.espremium = (espremium == 0);  
        this.nValoraciones=nValoraciones;
    }

    public Usuario() {    
    }

    public String getLocalizacion() {
        return localizacion;
    }

    public void setLocalizacion(String localizacion) {
        this.localizacion = localizacion;
    }

    
    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public int getnVentas() {
        return nVentas;
    }

    public void setnVentas(int nVentas) {
        this.nVentas = nVentas;
    }

    public int getnVisitas() {
        return nVisitas;
    }

    public void setnVisitas(int nVisitas) {
        this.nVisitas = nVisitas;
    }

    public String getNombre() {
        return nombre;
    }

    public void setNombre(String nombre) {
        this.nombre = nombre;
    }

    public String getCorreo() {
        return correo;
    }

    public void setCorreo(String correo) {
        this.correo = correo;
    }

    public String getContrasena() {
        return contrasena;
    }

    public void setContrasena(String contrasena) {
        this.contrasena = contrasena;
    }

    public Double getValoracion() {
        return valoracion;
    }

    public void setValoracion(Double valoracion) {
        this.valoracion = valoracion;
    }

    public Integer[] getIdpedidos() {
        return idpedidos;
    }

    public void setIdpedidos(Integer[] idpedidos) {
        this.idpedidos = idpedidos;
    }

    public boolean isEspremium() {
        return espremium;
    }

    public void setEspremium(boolean espremium) {
        this.espremium = espremium;
    }    
    public int getnValoraciones() {
        return nValoraciones;
    }

    public void setnValoraciones(int nValoraciones) {
        this.nValoraciones = nValoraciones;
    }

    @Override
    public String toString() {
        return "Usuario{" + "id=" + id + ", nVentas=" + nVentas + ", nVisitas=" + nVisitas + ", nombre=" + nombre + ", correo=" + correo + ", contrasena=" + contrasena + ", valoracion=" + valoracion + ", idpedidos=" + idpedidos + ", espremium=" + espremium + '}';
    }


    
}
