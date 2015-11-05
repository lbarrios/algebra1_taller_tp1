#!/usr/bin/env python
import random, argparse

# Parseo parametros
parser = argparse.ArgumentParser(description='Genera un video para el TP')
parser.add_argument('-x','--ancho', type=int, help='Ancho de cada frame (en pixeles)', required=True)
parser.add_argument('-y','--altura', type=int, help='Altura de cada frame (en pixeles)', required=True)
parser.add_argument('-z','--largo', type=int, help='Largo del video (en frames)', required=True)
parser.add_argument('-v','--variable', help='Nombre de la variable que contiene al video', required=True)
args = parser.parse_args()

# Input
PIXELS = ("pNegro","pGrisOscuro","pGrisClaro","pBlanco","pRojo","pVerde","pAzul","pAmarillo","pCian","pMagenta")

def genera_fila():
  return '[%s]'%(",".join([random.choice(PIXELS).rjust(1+len(max(PIXELS, key=len))) for x in range(0,args.ancho)]))

for frame_num in range(0,args.largo):
  print '%sf%s :: Frame'%(args.variable,frame_num)
  pixeles = ",\n".join([ genera_fila() for fila in range(0,args.altura) ])
  print '%sf%s = [\n%s]\n'%(args.variable,frame_num,pixeles)

video = "Iniciar %sf%s"%(args.variable,frame_num)
for frame_num in range(1,args.largo):
  video = "Agregar %sf%s (%s)"%(args.variable,frame_num,video)

print "%s = %s"%(args.variable,video)
