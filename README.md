¿Cuántas filas devuelve cada consulta y por qué son distintas? 
UNION ALL devuelve 14 filas porque incluye todas las filas de ambas sucursales sin eliminar duplicados.
UNION también devuelve 14 filas, porque aunque elimina duplicados, no existe ninguna fila idéntica entre inventario_sucursal_norte e 
inventario_sucursal_sur.

Explicá con ejemplos concretos de los datos qué filas se eliminaron con UNION.
Producto 103 aparece en ambas sucursales, pero con distinto stock (5 vs 3).
Como las filas no son idénticas, UNION no elimina ninguna.

Producto 104 también aparece en ambas, pero con stock diferente (20 vs 18).
Tampoco se elimina.

Producto 106 aparece en ambas, pero con stock diferente (10 vs 7).
Tampoco se elimina.

Como ninguna fila coincide en todas sus columnas, UNION no elimina ninguna.


¿Por qué UNION ALL es más eficiente que UNION?
UNION ALL es más eficiente porque no realiza el proceso de eliminar duplicados.
UNION sí lo hace, y para eso debe comparar todas las filas, lo cual consume más tiempo y recursos.

¿Qué operación adicional realiza UNION internamente que consume más recursos?
UNION realiza una operación adicional de ordenamiento y eliminación de duplicados.
Para eso debe comparar todas las filas entre sí, lo cual consume más CPU y memoria.
UNION ALL no hace esta comparación, por eso es más eficiente.

¿En qué casos de negocio usarías cada uno? Dá al menos dos ejemplos reales distintos a los del ejercicio.
UNION ALL (Mantener duplicados y priorizar velocidad)
Por ejemplo: Consolidación de Movimientos Financieros (Auditoría)
Un banco quiere mostrarle a un cliente su estado de cuenta unificado, juntando los datos de su "Cuenta Corriente" y su "Tarjeta de Crédito".
Si el cliente compró dos cafés exactamente por el mismo monto ($4.500) el mismo día en el mismo local (uno con débito y otro con crédito), 
ambos registros son operaciones reales. Si usaras UNION, el sistema vería las dos filas idénticas y borraría un gasto, haciendo que falte
dinero en el saldo final. 

UNION (Eliminar duplicados automáticamente)
Por ejemplo: Campaña de Marketing por Correo (Email Branding)
Una empresa quiere enviar un cupón de descuento por correo y junta la lista de "Clientes que compraron este mes" con la lista de "Usuarios 
registrados al boletín".
UNION: Muchos clientes activos también están registrados en el boletín.  Si usaras UNION ALL, a esas personas les llegaría el correo dos veces,
lo cual genera spam, molesta al usuario y duplica el costo de envío de la plataforma de marketing. UNION asegura que cada correo aparezca una 
sola vez en la lista final.


¿Qué pasa si las columnas de ambas consultas no coinciden en número o tipo? ¿Qué error genera SQL?
Si las columnas de ambas consultas no coinciden en número o tipo, la consulta falla por completo y no devuelve ninguna fila. SQL bloquea la 
ejecución de inmediato porque no sabe cómo estructurar la tabla final.

En SQL server devuelve un error: All queries combined using a UNION, INTERSECT or EXCEPT operator must have an equal number of expressions in their target lists.

