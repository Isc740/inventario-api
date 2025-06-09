namespace ADSO_Proyect.Interfaces
{
    public interface Interfaz<T>
    {
        Task<IEnumerable<T>> ObtenerTodos();
        Task<T> CrearRegistro(T entidad);
        Task<T> ObtenerPorID(int id);
    }
}
