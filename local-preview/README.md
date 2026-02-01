# Vista local (mock) - Proveedores

Este mini proyecto permite **previsualizar localmente** una app UI5 con **datos simulados**.

## ✅ Cómo abrir

### Opción rápida (sin instalar nada)
1. Abre una terminal en la carpeta `local-preview`.
2. **Verifica que estás dentro de `local-preview`** (debe contener `index.html`).
3. Ejecuta un servidor estático (usa Python si lo tienes):

```bash
python -m http.server 8080
```

4. Abre en el navegador:

```
http://localhost:8080/index.html
```

> Si aparece **404**, casi siempre es porque el servidor se inició **en otra carpeta**.

### ✅ Verificación rápida
En la terminal, corre:

```bash
dir
```

Debes ver `index.html` en la lista.

> También puedes usar `npx serve` si prefieres.

---

## ✅ Qué verás
- Lista de proveedores
- Filtro de búsqueda por nombre/ciudad
- Datos mock cargados en `webapp/Component.js`

---

## ✅ Datos mock
Puedes editar los datos aquí:

`webapp/Component.js`

---

Si quieres que lo conecte a OData real desde BTP, dímelo y lo preparo.