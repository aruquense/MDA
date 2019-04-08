package modelo;

public class Usuario {
    private Long id, nVentas, nVisitas;
    private String nombre, correo, contrasena,localizacion;
    private Double valoracion;
    private Integer[] idpedidos;
    private boolean espremium;

    public Usuario(Long id, Long nVentas, Long nVisitas,String localizacion, String nombre, String correo, String contrasena, Double valoracion, Integer[] idpedidos, int espremium) {
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

    public Long getnVentas() {
        return nVentas;
    }

    public void setnVentas(Long nVentas) {
        this.nVentas = nVentas;
    }

    public Long getnVisitas() {
        return nVisitas;
    }

    public void setnVisitas(Long nVisitas) {
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

    @Override
    public String toString() {
        return "Usuario{" + "id=" + id + ", nVentas=" + nVentas + ", nVisitas=" + nVisitas + ", nombre=" + nombre + ", correo=" + correo + ", contrasena=" + contrasena + ", valoracion=" + valoracion + ", idpedidos=" + idpedidos + ", espremium=" + espremium + '}';
    }
    
}
