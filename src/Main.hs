module Main where
import Tipos
import Funciones
import EjemplosCatedra
import EjemplosPropios

--------------------------------------------------------------------------------
-- Ejercicio 1/5

-- ultimoFrame toma un video y devuelve su último frame
ultimoFrame :: Video -> Frame
ultimoFrame (Iniciar f) = f
ultimoFrame (Agregar f _) = f

--------------------------------------------------------------------------------
-- Ejercicio 2/5

-- norma toma una terna y devuelve la norma 2 del vector representado por sus componentes
norma :: (Integer, Integer, Integer) -> Float
norma (a, b, c) = sqrt (fromInteger (a^2 + b^2 + c^2))

--------------------------------------------------------------------------------
-- Ejercicio 3/5

-- pixelsDiferentesEnFrame toma dos frames, un umbral
-- y devuelve un frame comprimido que contiene a los píxeles cuya variación resulta mayor que el umbral.
pixelsDiferentesEnFrame :: Frame -> Frame -> Float -> FrameComprimido
pixelsDiferentesEnFrame f1 f2 umbral = pixelsDiferentesEnFilas 0 f1 f2 umbral

-- pixelsDiferentesEnFilas toma una fila, dos frames, un umbral
-- y devuelve un frame comprimido que contiene a los píxeles cuya variación resulta mayor que el umbral.
pixelsDiferentesEnFilas :: Integer -> Frame -> Frame -> Float -> FrameComprimido
pixelsDiferentesEnFilas fila [] _ umbral = []
pixelsDiferentesEnFilas fila (f1 : f1s) (f2 : f2s) umbral = verDeltaPixel ++ pixelsDiferentesEnFilas (fila+1) f1s f2s umbral
  where verDeltaPixel = pixelsComprimidosSiDiferente fila 0 f1 f2 umbral

-- pixelsComprimidosSiDiferente recibe una fila, una columna, dos listas de píxeles correspondientes 
-- a frames consecutivos (que se encuentran en la fila y a partir de la columna indicadas), más un umbral.
-- Devuelve un frame comprimido que contiene a los píxeles cuya variación resulta mayor que el umbral.
pixelsComprimidosSiDiferente :: Integer -> Integer -> [Pixel] -> [Pixel] -> Float -> FrameComprimido
pixelsComprimidosSiDiferente y x [] [] umbral = []
pixelsComprimidosSiDiferente y x (p1 : p1s) (p2 : p2s) umbral 
  | abs (norma (restarPixeles p1 p2)) > umbral = [(y, x, (restarPixeles p1 p2))] ++ recursion
  | otherwise = recursion
  where recursion = pixelsComprimidosSiDiferente y (x+1) p1s p2s umbral

-- restarPixeles recibe dos píxeles (cada uno representado por un vector)
-- y devuelve un tercer vector que resulta de la diferencia entre ambos
restarPixeles :: Pixel -> Pixel -> PixelDelta
restarPixeles (x1, y1, z1) (x2, y2, z2) = (x1-x2,y1-y2,z1-z2)

--------------------------------------------------------------------------------
-- Ejercicio 4/5

-- comprimir toma un video y dos umbrales: uno para la comparación de píxeles y otro para la cantidad de píxeles distintos.
-- Devuelve un video donde están comprimidos los frames que superan el segundo umbral.
comprimir :: Video -> Float -> Integer -> VideoComprimido
comprimir (Iniciar f) umbralPixel umbralFrameComprimido  = IniciarComp f
comprimir (Agregar f v) umbralPixel umbralFrameComprimido
  | fromIntegral (length (frameComprimido)) <= umbralFrameComprimido = AgregarComprimido frameComprimido recursion
  | otherwise = AgregarNormal f recursion
  where frameComprimido = pixelsDiferentesEnFrame f (ultimoFrame v) umbralPixel
        recursion = comprimir v umbralPixel umbralFrameComprimido

--------------------------------------------------------------------------------
-- Ejercicio 5/5

-- descomprimir toma un video comprimido y recompone los cambios realizados por la compresión original.
descomprimir :: VideoComprimido -> Video
descomprimir (IniciarComp f) = Iniciar f
descomprimir (AgregarNormal f v) = Agregar f (descomprimir v)
descomprimir (AgregarComprimido f v) = Agregar fdc (descomprimir v)
  where fdc = aplicarCambio (ultimoFrame (descomprimir v)) f
