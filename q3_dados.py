import json
import xml.etree.ElementTree as ET

def ler_dados_json(arquivo):
    with open(arquivo, "r", encoding="utf-8") as file:
        return json.load(file)

def ler_dados_xml(arquivo):
    tree = ET.parse(arquivo)
    root = tree.getroot()
    dados = []
    
    for row in root.findall("row"):
        dia = int(row.find("dia").text)
        valor = float(row.find("valor").text)
        dados.append({"dia": dia, "valor": valor})
    
    return dados

try:
    dados_json = ler_dados_json("dados.json")
    dados = dados_json
except FileNotFoundError:
    dados_xml = ler_dados_xml("dados.xml")
    dados = dados_xml

faturamento_diario = [dia["valor"] for dia in dados if dia["valor"] > 0]

menor_faturamento = min(faturamento_diario)
maior_faturamento = max(faturamento_diario)
media_mensal = sum(faturamento_diario) / len(faturamento_diario)

dias_acima_da_media = sum(1 for valor in faturamento_diario if valor > media_mensal)

print(f"Menor faturamento diário: R$ {menor_faturamento:.2f}")
print(f"Maior faturamento diário: R$ {maior_faturamento:.2f}")
print(f"Número de dias com faturamento acima da média: {dias_acima_da_media}")
