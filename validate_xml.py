import os
import xml.etree.ElementTree as ET
from pathlib import Path

def validate_xml_file(filepath):
    """Valida un archivo XML y retorna True si es válido, False si no"""
    try:
        ET.parse(filepath)
        return True, None
    except ET.ParseError as e:
        return False, str(e)
    except Exception as e:
        return False, str(e)

def validate_directory(directory):
    """Valida todos los archivos XML en un directorio"""
    xml_files = list(Path(directory).glob('*.xml'))
    
    if not xml_files:
        print(f"⚠️  No se encontraron archivos XML en {directory}")
        return
    
    print(f"📂 Validando {len(xml_files)} archivos XML en {directory}\n")
    
    valid_count = 0
    invalid_count = 0
    invalid_files = []
    
    for xml_file in sorted(xml_files):
        is_valid, error = validate_xml_file(xml_file)
        
        if is_valid:
            print(f"✅ {xml_file.name}")
            valid_count += 1
        else:
            print(f"❌ {xml_file.name}")
            print(f"   Error: {error}")
            invalid_count += 1
            invalid_files.append((xml_file.name, error))
    
    print(f"\n{'='*60}")
    print(f"RESUMEN:")
    print(f"  ✅ Válidos:   {valid_count}")
    print(f"  ❌ Inválidos: {invalid_count}")
    print(f"  📊 Total:     {len(xml_files)}")
    print(f"{'='*60}")
    
    if invalid_files:
        print("\n⚠️  Archivos con errores:")
        for filename, error in invalid_files:
            print(f"  - {filename}: {error}")
        return False
    else:
        print("\n🎉 ¡Todos los archivos XML son válidos!")
        return True

if __name__ == "__main__":
    # Directorio a validar
    target_dir = "src/zz_luces_paq_prove"
    
    print("="*60)
    print("   VALIDADOR DE ARCHIVOS XML - ABAP Cloud")
    print("="*60)
    print()
    
    if not os.path.exists(target_dir):
        print(f"❌ Error: El directorio '{target_dir}' no existe")
        exit(1)
    
    all_valid = validate_directory(target_dir)
    
    if all_valid:
        exit(0)
    else:
        exit(1)
