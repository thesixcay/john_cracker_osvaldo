#!/bin/bash

# Verificar si John está instalado
if ! command -v john &> /dev/null; then
    echo "Hola, soy Osvaldo. Parece que John the Ripper no está instalado. Instalándolo por ti..."
    sudo apt-get update && sudo apt-get install -y john
fi

# Función para mostrar el menú
show_menu() {
    echo "========================="
    echo "   Script de Osvaldo"
    echo "========================="
    echo "1. Crackear hashes desde un archivo"
    echo "2. Mostrar resultados anteriores"
    echo "3. Salir"
    echo "========================="
    echo -n "Selecciona una opción: "
}

# Bucle principal
while true; do
    show_menu
    read -r option
    case $option in
        1)
            echo "Soy Osvaldo. Ayudándote a crackear hashes."
            echo -n "Ingresa la ruta del archivo con hashes: "
            read -r hash_file
            if [[ -f "$hash_file" ]]; then
                echo "Crackeando hashes por ti, paciencia..."
                john "$hash_file"
                echo "Proceso completado. Usa la opción 2 para ver los resultados."
            else
                echo "El archivo no existe. Inténtalo de nuevo."
            fi
            ;;
        2)
            echo "Resultados anteriores:"
john --show
            ;;
        3)
            echo "Soy Osvaldo. ¡Hasta luego!"
            exit 0
            ;;
        *)
            echo "Opción inválida. Inténtalo de nuevo."
            ;;
    esac
done
