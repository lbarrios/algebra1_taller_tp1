module Main where

import Tipos
import Funciones
import EjemplosCatedra
import EjemplosPropios

main = do
  putStrLn "video1="
  putStrLn (show video1)

-- Auxiliares
restarPixeles :: Pixel -> Pixel -> PixelDelta
restarPixeles (x1, y1, z1) (x2, y2, z2) = (x1-x2,y1-y2,z1-z2)


-- Ejercicio 1/5
ultimoFrame :: Video -> Frame
ultimoFrame (Iniciar f) = f
ultimoFrame (Agregar f _) = f
-- *Main> ultimoFrame v1 == v1f4
-- True

-- Ejercicio 2/5
norma :: (Integer, Integer, Integer) -> Float
norma (a, b, c) = sqrt (fromInteger (a^2 + b^2 + c^2))
-- *Main> norma (10, 20, 30)
-- 37.416573


-- Ejercicio 3/5
pixelsDiferentesEnFrame :: Frame -> Frame -> Float -> FrameComprimido
pixelsDiferentesEnFrame f1 f2 umbral = pixelsDiferentesEnFilas 0 f1 f2 umbral
-- *Main> pixelsDiferentesEnFrame v1f1 v2f2 1
-- [(0,0,(3,3,3)),(0,1,(3,3,3)),(1,0,(3,3,3)),(1,2,(-3,-3,-3)),(2,1,(-3,-3,-3)),(2,2,(-3,-3,-3))]

pixelsDiferentesEnFilas :: Integer -> Frame -> Frame -> Float -> FrameComprimido
pixelsDiferentesEnFilas fila [] _ umbral = []
pixelsDiferentesEnFilas fila f1 f2 umbral = pixelsComprimidosSiDiferente fila 0 (head f1) (head f2) umbral ++ pixelsDiferentesEnFilas (fila+1) (tail f1) (tail f2) umbral

pixelsComprimidosSiDiferente :: Integer -> Integer -> [Pixel] -> [Pixel] -> Float -> [ (Integer, Integer, PixelDelta) ]
pixelsComprimidosSiDiferente y x [] [] umbral = []
pixelsComprimidosSiDiferente y x ps1 ps2 umbral 
	| abs (norma (restarPixeles (head ps1) (head ps2))) >= umbral = [(y, x, (restarPixeles (head ps1) (head ps2)))] ++ recursion
	| otherwise = recursion
	where recursion = pixelsComprimidosSiDiferente y (x+1) (tail ps1) (tail ps2) umbral



-- Ejercicio 4/5
comprimir :: Video -> Float -> Integer -> VideoComprimido
comprimir (Iniciar f) umbralPixel umbralFrameComprimido  = IniciarComp f
comprimir (Agregar f v) umbralPixel umbralFrameComprimido
	| fromIntegral (length (frameComprimido)) <= umbralFrameComprimido = AgregarComprimido frameComprimido recursion
	| otherwise = AgregarNormal f recursion
	where frameComprimido = pixelsDiferentesEnFrame (ultimoFrame v) f umbralPixel
	      recursion = comprimir v umbralPixel umbralFrameComprimido

-- Ejercicio 5/5
descomprimir :: VideoComprimido -> Video
descomprimir = error "Implementar!!! (ejercicio 5)"
