# 🔧 Guía Paso a Paso: Orden de Activación en Eclipse ADT

## ⚠️ Problema Detectado

Los errores muestran:
- ❌ "The data source 'zdatafbk' does not exist or is not active"
- ❌ "The data source 'zdataprov' does not exist or is not active"

**Causa:** Las tablas no están activadas o tienen errores.

---

## 📋 PASO 1: Verificar y Activar las Tablas

### 1.1. Verificar que las tablas existen

En el **Project Explorer**, navega a:
```
ZZ_LUCES_PAQ_PROVE → Dictionary (o Data Definitions)
```

Deberías ver:
- ZDATAPROV (tabla)
- ZDATALFBK (tabla)

### 1.2. Revisar errores en las tablas

**Para ZDATAPROV:**
1. Abre la tabla `ZDATAPROV` haciendo doble clic
2. Verifica que el contenido sea:

```abap
@EndUserText.label : 'Datos Proveedor'
@AbapCatalog.enhancement.category : #NOT_EXTENSIBLE
@AbapCatalog.tableCategory : #TRANSPARENT
@AbapCatalog.deliveryClass : #A
@AbapCatalog.dataMaintenance : #RESTRICTED
define table zdataprov {
  key client    : abap.clnt not null;
  key prov_id   : zmm_d_prov_id not null;
  name1         : zmm_d_prov_name;
  country       : zmm_d_country;
  city          : zmm_d_city;
  street        : zmm_d_street;
  created_on    : zmm_d_created_on;
  nif1          : zmm_d_nif1;
  created_by    : zmm_d_created_by;
}
```

3. Si hay errores, corrígelos
4. Presiona **Ctrl+F3** o clic en **Activate**
5. **Espera hasta que veas "Activation successful"**

**Para ZDATALFBK:**
1. Abre la tabla `ZDATALFBK` haciendo doble clic
2. Verifica que el contenido sea:

```abap
@EndUserText.label : 'Datos Bancarios Proveedor'
@AbapCatalog.enhancement.category : #NOT_EXTENSIBLE
@AbapCatalog.tableCategory : #TRANSPARENT
@AbapCatalog.deliveryClass : #A
@AbapCatalog.dataMaintenance : #RESTRICTED
define table zdatalfbk {
  key client        : abap.clnt not null;
  key prov_id       : zmm_d_prov_id not null;
  key bank_country  : zmm_d_country not null;
  key bank_key      : zmm_d_bank_key not null;
  key bank_account  : zmm_d_bank_acc not null;
  account_holder    : zmm_d_acc_holder;
  bank_cc           : zmm_d_bank_cc;
  bank_type         : zmm_d_bank_type;
}
```

3. Si hay errores, corrígelos
4. Presiona **Ctrl+F3** o clic en **Activate**
5. **Espera hasta que veas "Activation successful"**

---

## 📋 PASO 2: Activar CDS Views (Data Definitions)

### 2.1. Activar ZMM_I_PROV (Vista Principal)

1. En el Project Explorer, navega a:
   ```
   ZZ_LUCES_PAQ_PROVE → Core Data Services → Data Definitions
   ```

2. Busca y abre **ZMM_I_PROV**

3. Verifica que el código tenga `as select from zdataprov` (minúsculas, sin guiones bajos)

4. Presiona **Ctrl+F3** o clic en **Activate**

5. **Espera la confirmación de activación exitosa**

### 2.2. Activar ZMM_I_PROV_BANK (Vista Asociada)

1. Busca y abre **ZMM_I_PROV_BANK**

2. Verifica que el código tenga `as select from zdatalfbk` (minúsculas, sin guiones bajos)

3. Presiona **Ctrl+F3** o clic en **Activate**

4. **Espera la confirmación de activación exitosa**

---

## 📋 PASO 3: Activar Metadata Extensions

### 3.1. Activar ZMM_I_PROV_UI

1. En el Project Explorer, navega a:
   ```
   ZZ_LUCES_PAQ_PROVE → Core Data Services → Metadata Extensions
   ```

2. Busca y abre **ZMM_I_PROV_UI**

3. Presiona **Ctrl+F3** o clic en **Activate**

### 3.2. Activar ZMM_I_PROV_BANK_UI

1. Busca y abre **ZMM_I_PROV_BANK_UI**

2. Presiona **Ctrl+F3** o clic en **Activate**

---

## 📋 PASO 4: Activar Service Definition

1. En el Project Explorer, navega a:
   ```
   ZZ_LUCES_PAQ_PROVE → Business Services → Service Definitions
   ```

2. Busca y abre **ZMM_SRV_PROV**

3. Presiona **Ctrl+F3** o clic en **Activate**

4. **Espera la confirmación**

---

## 📋 PASO 5: Activar Service Binding

1. En el Project Explorer, navega a:
   ```
   ZZ_LUCES_PAQ_PROVE → Business Services → Service Bindings
   ```

2. Busca y abre **ZMM_SRV_PROV**

3. Presiona **Ctrl+F3** o clic en **Activate**

4. Después de activar, haz clic en el botón **Publish** (en la parte superior del editor)

---

## 📋 PASO 6: Activar y Ejecutar la Clase

### 6.1. Activar la clase

1. En el Project Explorer, navega a:
   ```
   ZZ_LUCES_PAQ_PROVE → Source Code Library → Classes
   ```

2. Busca y abre **ZMM_CL_PROV_LOAD_001**

3. Verifica que el código use `zdataprov` y `zdatalfbk` (minúsculas, sin guiones bajos)

4. Presiona **Ctrl+F3** o clic en **Activate**

### 6.2. Ejecutar la clase para cargar datos

1. Con la clase **ZMM_CL_PROV_LOAD_001** abierta

2. Presiona **F9** o clic derecho → **Run As** → **ABAP Application (Console)**

3. En la consola deberías ver:
   ```
   Proveedores cargados: 5 / Datos bancarios: 5
   ```

---

## 🔍 Solución de Problemas

### Si las tablas no aparecen en Dictionary:

1. **Refrescar** el Project Explorer (F5)
2. **Cerrar y reabrir** Eclipse ADT
3. Si aún no aparecen, créalas nuevamente manualmente (ver guía CREAR_TABLAS_MANUALMENTE.md)

### Si persisten errores de "data source does not exist":

**Verifica el nombre exacto de las tablas:**
1. En el Project Explorer, expande Dictionary
2. Verifica que se llamen exactamente:
   - `ZDATAPROV` (todo junto, sin guiones bajos)
   - `ZDATALFBK` (todo junto, sin guiones bajos)

3. Si tienen nombres diferentes (ej: `Z_DATA_PROV`), tienes dos opciones:

   **Opción A (Recomendada):** Renombrar las tablas en el sistema
   - Elimina las tablas antiguas
   - Créalas nuevamente con los nombres correctos

   **Opción B:** Actualizar el código fuente
   - Edita `ZMM_I_PROV` y cambia `zdataprov` al nombre real de tu tabla
   - Edita `ZMM_I_PROV_BANK` y cambia `zdatalfbk` al nombre real
   - Edita `ZMM_CL_PROV_LOAD_001` y actualiza todos los nombres

---

## ✅ Verificación Final

Después de activar todo:

1. ✅ Ambas tablas activadas sin errores
2. ✅ Ambos CDS Views activados
3. ✅ Ambas Metadata Extensions activadas
4. ✅ Service Definition activado
5. ✅ Service Binding activado y publicado
6. ✅ Clase activada y ejecutada con éxito
7. ✅ 5 proveedores y 5 datos bancarios cargados

---

## 🎯 Resumen del Orden de Activación

```
1. ZDATAPROV (Tabla)           ← PRIMERO
2. ZDATALFBK (Tabla)           ← PRIMERO
3. ZMM_I_PROV (CDS View)
4. ZMM_I_PROV_BANK (CDS View)
5. ZMM_I_PROV_UI (Metadata Ext)
6. ZMM_I_PROV_BANK_UI (Metadata Ext)
7. ZMM_SRV_PROV (Service Def)
8. ZMM_SRV_PROV (Service Bind) → PUBLISH
9. ZMM_CL_PROV_LOAD_001 (Clase) → EJECUTAR (F9)
```

---

**Fecha:** 23 de enero de 2026
**Versión:** 2.0
