def deleteRepetidos(vector):
    temp = vector
    resultado = []
    longi = len(temp)
    i = 0
    while len(temp)>0:
        longi = len(temp)
        valor = temp[0]
        resultado[len(resultado):]=[valor]
        while valor in temp:
            temp.remove(valor)
    return resultado