# Guía: Crear Tablas Manualmente en Eclipse ADT

## ⚠️ Problema Identificado

Las tablas **Z_DATA_PROV** y **Z_DATA_LFBK** no existen en tu sistema SAP BTP y abapGit no puede crearlas automáticamente debido a restricciones de la plataforma.

**Solución:** Crearlas manualmente en Eclipse ADT antes de volver a hacer Pull.

---

## 📋 Paso 1: Crear la Tabla Z_DATA_PROV

### 1.1. Crear el objeto tabla
1. En Eclipse ADT, navega al paquete `ZZ_LUCES_PAQ_PROVE`
2. Clic derecho → **New** → **Other ABAP Repository Object**
3. Busca y selecciona **Database Table**
4. Clic en **Next**

### 1.2. Configuración básica
- **Name:** `Z_DATA_PROV`
- **Description:** `Datos Proveedor`
- **Package:** `ZZ_LUCES_PAQ_PROVE`
- Clic en **Next** y luego **Finish**

### 1.3. Definir la estructura
Reemplaza el contenido con:

```abap
@EndUserText.label : 'Datos Proveedor'
@AbapCatalog.enhancement.category : #NOT_EXTENSIBLE
@AbapCatalog.tableCategory : #TRANSPARENT
@AbapCatalog.deliveryClass : #A
@AbapCatalog.dataMaintenance : #RESTRICTED
define table z_data_prov {
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

### 1.4. Activar
- Presiona **Ctrl+F3** o clic en el botón **Activate**
- Verifica que se active sin errores

---

## 📋 Paso 2: Crear la Tabla Z_DATA_LFBK

### 2.1. Crear el objeto tabla
1. En el paquete `ZZ_LUCES_PAQ_PROVE`
2. Clic derecho → **New** → **Other ABAP Repository Object**
3. Selecciona **Database Table**
4. Clic en **Next**

### 2.2. Configuración básica
- **Name:** `Z_DATA_LFBK`
- **Description:** `Datos Bancarios Proveedor`
- **Package:** `ZZ_LUCES_PAQ_PROVE`
- Clic en **Next** y luego **Finish**

### 2.3. Definir la estructura
Reemplaza el contenido con:

```abap
@EndUserText.label : 'Datos Bancarios Proveedor'
@AbapCatalog.enhancement.category : #NOT_EXTENSIBLE
@AbapCatalog.tableCategory : #TRANSPARENT
@AbapCatalog.deliveryClass : #A
@AbapCatalog.dataMaintenance : #RESTRICTED
define table z_data_lfbk {
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

### 2.4. Activar
- Presiona **Ctrl+F3** o clic en el botón **Activate**
- Verifica que se active sin errores

---

## 📋 Paso 3: Volver a Hacer Pull

Una vez creadas y activadas ambas tablas:

1. **Cierra** Eclipse ADT completamente
2. **Reabre** Eclipse ADT
3. En la vista **abapGit Repositories**, haz clic en el repositorio
4. Clic en **Pull**
5. Esta vez, las tablas deberían mostrar "not changed; no import required" ✅

---

## 🔄 Alternativa: Importar desde archivo

Si prefieres, también puedes:

1. Navegar en el Project Explorer a:
   - `src/zz_luces_paq_prove/z_data_prov.tabl.xml`
   - `src/zz_luces_paq_prove/z_data_lfbk.tabl.xml`

2. Para cada archivo:
   - Clic derecho → **Create in System** o **Import**
   - Seguir el asistente

---

## ✅ Verificación

Después de crear las tablas, verifica:

1. En el **Project Explorer**, expande el paquete `ZZ_LUCES_PAQ_PROVE`
2. Busca en **Data Definition** o **Dictionary**:
   - ✅ Z_DATA_PROV (debe aparecer con ícono de tabla)
   - ✅ Z_DATA_LFBK (debe aparecer con ícono de tabla)

---

## 🎯 Próximos Pasos

Una vez creadas las tablas:

1. ✅ Hacer Pull nuevamente (ya no debe dar error)
2. ✅ Activar los CDS Views: `ZMM_I_PROV`, `ZMM_I_PROV_BANK`
3. ✅ Activar las Metadata Extensions
4. ✅ Activar Service Definition y Binding
5. ✅ Ejecutar la clase `ZMM_CL_PROV_LOAD_001` para cargar datos
6. ✅ Publicar el servicio `ZMM_SRV_PROV`

---

## 💡 Nota Importante

En SAP BTP (ABAP Cloud), las tablas de base de datos a menudo deben crearse manualmente porque:
- Tienen restricciones de seguridad más estrictas
- Requieren configuraciones específicas de la plataforma cloud
- abapGit tiene limitaciones para crear estructuras de base de datos directamente

**Esto es completamente normal en proyectos ABAP Cloud.**

---

**Fecha:** 23 de enero de 2026
