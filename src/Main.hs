module Main where

import Tipos
import Funciones
import EjemplosCatedra
import EjemplosPropios

main = do
  putStrLn "video1="
  putStrLn (show video1)

-- Ejercicio 1/5
ultimoFrame :: Video -> Frame
ultimoFrame = error "Implementar!!! (ejercicio 1)"
-- *Main> ultimoFrame video0 == f1
-- True

-- Ejercicio 2/5
norma :: (Integer, Integer, Integer) -> Float
norma = error "Implementar!!! (ejercicio 2)"
-- *Main> norma (10, 20, 30)
-- 37.416573

-- Ejercicio 3/5
pixelsDiferentesEnFrame :: Frame -> Frame -> Float -> FrameComprimido
pixelsDiferentesEnFrame = error "Implementar!!! (ejercicio 3)"
-- *Main> pixelsDiferentesEnFrame v1f1 v2f2 1
-- [(0,0,(3,3,3)),(0,1,(3,3,3)),(1,0,(3,3,3)),(1,2,(-3,-3,-3)),(2,1,(-3,-3,-3)),(2,2,(-3,-3,-3))]


-- Ejercicio 4/5
comprimir :: Video -> Float -> Integer -> VideoComprimido
comprimir = error "Implementar!!! (ejercicio 4)"

-- Ejercicio 5/5
descomprimir :: VideoComprimido -> Video
descomprimir = error "Implementar!!! (ejercicio 5)"