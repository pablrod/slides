
#### Madrid Perl Workshop 2017

## Introducción a Machine Learning con Perl!

<img src="http://madrid.pm.org/static/madrid-pm.png" style="border:0px;background:rgba(255,255,255,0)">

[Madrid.pm](http://madrid.pm.org/)

2017-06-03

Pablo Rodríguez González [@PabloComputing](https://twitter.com/PabloComputing)

[Github repository](https://github.com/pablrod/slides/tree/master/perl_machine_learning_intro)

---

# ¿Machine Learning?

Note:

¿Por qué vamos a hablar de esto? Porque el workshop va de hacer cosas con el ordenador, de resolver problemas con el ordenador, y utilizando Perl

Reconocimiento de escritura

Reconocimiento de caras

Mejorar el sonido que oimos al grabar con un micro

Productos recomendados

Películas recomendadas

___

# Buzzword

Note:

Está de moda!

Tiene mucho Hype!!

Todo el mundo habla de ello

Empieza a estar presente en todo

___

### Hype

<img src="http://na2.www.gartner.com/imagesrv/newsroom/images/emerging-tech-hc-2016.png;wa59f7b006c484099e">

Gartner: [http://www.gartner.com/newsroom/id/3412017](http://www.gartner.com/newsroom/id/3412017)

Note:

En julio de 2016 estaba en la cresta de la ola!!!

Curioso porque la mayoría de esto viene de la época de la IA (Lisp Machines, Neural Networks, Rosenblat, Perceptron)

___

### Ubicuidad

* Tiendas web
* Compras tarjeta
* Seguros
* Cámaras de fotos
* Coches autónomos
* Teléfonos
* ...

___

# ¡Machine Learning!

---

### ¿Qué es Machine Learning?

Wikipedia: https://en.wikipedia.org/wiki/Machine_learning

No soy quien para definir el término

Note:

Estadística, Business Inteligence, Data Mining, Inteligencia artificial, Knowledge Discovery

___


### ¿Y en esta charla?

<!-- .element: class="fragment" -->Algoritmos que mejoran su resultado a través de la experiencia

<!-- .element: class="fragment" -->Herramientas para hacer predicciones

Note:

Ejemplos con regresión lineal, conducción autónoma, productos recomendados tienda web

El aprendizaje no supervisado: perfil comprador típico, ¿Procesos típicos en nuestra máquina? -> Detección de anomalías

La experiencia no vale cualquiera: cantidad es diferente a calidad

La mayoría de estos algoritmos vienen de la IA

Herramientas para hacer predicciones

Transformar datos en información, idealmente queremos que la máquina pueda responder a preguntas sobre los datos

Extrayendo reglas o patrones en los datos

___

### ¿Realmente necesito esto?

<!-- .element: class="fragment" -->¡Yo se programmar!

<!-- .element: class="fragment" --> No lo sabemos todo

Note:

Sí lo necesito, para conseguir comportamientos para los que no han sido explícitamente programados, es decir, sistemas expertos 

Todo cambia, turbinas eolicas que se estropean, etc los algoritmos se van adaptando

Los datos ahora se generan solos, y tenemos capacidad para almacenarlos y procesarlos, luego hemos resuelto el problema de tener una base con la que entrenarlo, extraer el conocimiento ya se encarga la máquina... ¿Si? ¿Seguro?

___

### Inteligencia artificial

Reconocer patrones como lo hace el cerebro:

* Escritura
* Un tigre en la sabana
* ...

Note:


* Reconocimiento de escritura
* Filtrar emails
* Comportamiento sospechoso (alguien ha entrado en nuestro ordenador?)

___

---

¡Vamos a hacer predicciones!

Note:

Lo llamamos predicciones porque aunque tenemos parte de la información, pero no es toda, hay incertidumbre

Estos algoritmos nos dan una "aproximación" (predicción) al valor real

---

¿Cómo?

---

## Regresión lineal

La regresión lineal "captura" la relación que hay entre dos variables

Note:

Ejemplo: comida ingerida y peso

¿Esto aprende de la "experiencia"?

___



```execute_perl
examples/linear_regression/linear_regression.pl
```


___


## Ejemplo clasificador kNN

<!-- .element: class="fragment" -->¿kNN?

<!-- .element: class="fragment" -->k Nearest Neighbours (Análogos)

<!-- .element: class="fragment" -->Definimos una "métrica"

Note:

https://www.datacamp.com/community/tutorials/machine-learning-in-r#gs.yMpcc2I

___

```execute_perl
examples/knn/knn.pl
```


---

### ¿Qué tipo de problemas podemos resolver con Machine Learning?

Tipos de problemas:

* Regresión
* Clasificación
* Clustering 
* Detección de anomalías

* Estimación de distribuciones
* Reducción de la dimensionalidad

Note:

* Clasificación (No es un problema de clústering?)
* Clustering (No es un problema de clasificación?)
* Detección de anomalías (No es un problema de clústering?)
---

### ¿Cómo resolvemos esos problemas usando Machine learning?

Técnicas de resolución

* Supervisadas
* No supervisadas

Note:

Cómo los resuelve, métodos generales

---

### Grupos de algoritmos para machine learning

* Redes neuronales
* Árboles de decisión
* Support Vector Machines
* Análogos
* Métodos bayesianos

Note:

Implementaciones concretas de diferentes técnicas de resolución 

---

### ¿Qué tiene que ver con Big Data?

Puedes hacer Machine Learning con 20 datos (lo hemos hecho antes con 60)

¿Qué hacer con tantos datos? => Qué se encargue la máquina!

---

### [PDL](https://metacpan.org/pod/PDL)

<!-- .element: class="fragment" -->Perl

<!-- .element: class="fragment" -->Data

<!-- .element: class="fragment" -->Language

___

#### ¿Qué es PDL?

- Manipulación eficiente de datos <!-- .element: class="fragment" data-fragment-index="1" -->
- Conjunto de módulos <!-- .element: class="fragment" data-fragment-index="2" -->
- Basado en arrays <!-- .element: class="fragment" data-fragment-index="3" -->

Note:

Cómo lo consigue? Utilizando buffers uniformes y compactos de memoria contigua

Utiliza vistas

___

#### Perl también tiene arrays...

* Pero solo de una dimensión
* Los arrays en Perl son estructuras no triviales (2D: listas de listas)
* La auto-vivificación es costosa
* Es de propósito general
___

#### Entidad básica: "Piddle"

* Es un buffer de C, un puntero
* Región de memoria contigua
* Se utiliza para almacenar colecciones de datos N-dimensionales
* Puede contener los tipos fundamentales pero también definidos por el usuario
* En realidad es un objeto con el buffer y la información necesaria para trabajar cómodamente

___

#### [Data::Frame](https://metacpan.org/pod/Data::Frame)


```perl

my $data_frame = Data::Frame->new(columns => [x => pdl(1, 2, 3)]);

my $iris = Data::Dataset::Classic::Iris::get(as => 'Data::Frame');

```
___

```execute_perl
examples/linear_regression/linear_regression_pdl.pl
```

---

### Wrap Up

¿Qué hemos hecho hasta ahora?

<!-- .element: class="fragment" -->Clasificación: kNN 

<!-- .element: class="fragment" -->Predicción numérica: regresión lineal 

Note:

¿No hay un patrón en lo que hacemos?

¿Estamos haciendo Machine Learning sobre el código?

---

### ¿Cómo hago Machine Learning?

Cuatro pasos principales:

* Obtener, extraer, manipular los datos
* Análisis y elección de modelo
* Entrenamiento del modelo
* Validación del modelo

___

¿Y subir a producción?

___

### ¿Cómo hago Machine Learning?

Seis pasos principales:

* Obtener, extraer, manipular los datos
* Análisis y elección de modelo
* Entrenamiento del modelo
* Validación del modelo
* Subir a producción
* Predecir (en producción)

Note:

Vamos a ver en detalle esos pasos

---

#### Datos

___

Web

Note:

La principal fuente de datos

___

* [Data::Dataset::Classic](https://metacpan.org/pod/Data::Dataset::Classic)
* [https://archive.ics.uci.edu/ml/](https://archive.ics.uci.edu/ml/)

___

##### Higiene

¡Cuidado datos malos!

Note:

Es muy importante filtrar los datos

Tu modelo puede ser muy bueno, pero si los datos son malos...

---

#### Análisis

Muchas veces no somos expertos en esos datos, o simplemente no sabemos por donde empezar

Asique hacemos análisis exploratorio, que se suele componer visualizaciones y resúmenes de los datos (indicadores estadísticos)

---

#### Entrenamiento

___

##### ¿Cómo se adaptan los algoritmos a los datos?

___

Función objetivo (loss function)

___


Habitualmente indicadores de error:

* ECM
* EMA
* ...

___

```perl
sub ErrorMedioAbsoluto {
    my $valor_real = topdl(shift);
    my $valor_estimado = topdl(shift);
    return avg(abs($valor_real - $valor_estimado);
}
```

___

Ajustaremos los parámetros para minimizar/maximizar nuestra función objetivo

___

Optimización
___

Esto es el "entrenamiento"

Note:

Y esto de Machine learning no es que tengamos a un robot que nos entienda perfectamente
Tenemos que decirle a la máquina qué queremos, un "objetivo" 

El algoritmo "se adapta" a nuestro "objetivo" (relativamente bien definido)

___

Métodos de optimización:

* Descenso del gradiente
* Fuerza bruta

___

Obtenemos:

* Parámetros del algoritmo que minimizan el error

---

#### Validación

¿Para qué?

___

Sobreajuste 

([Overfitting](https://en.wikipedia.org/wiki/Overfitting))

___


<img src="https://upload.wikimedia.org/wikipedia/commons/6/68/Overfitted_Data.png" style="border:0px;">

___

Poca capacidad predictiva

(Underfitting)

___

```execute_perl
examples/overfitting/anscombe.pl
```

##### [Validación cruzada](https://en.wikipedia.org/wiki/Cross-validation_(statistics))

___


##### [Validación cruzada](https://en.wikipedia.org/wiki/Cross-validation_(statistics))

* Exhaustivas
 * Dejar uno fuera
 * Dejar p fuera
* No exhaustivas
 * Hold out
 * K-fold
 * Random sub-sampling (Montecarlo)

Note:

Cuidado con las exhaustivas! La combinatoria nos la juega... pero si tengo pocos datos...

___

Habitualmente:

* Hold out (70%-30%)

* K-fold

___

```perl
my $iris = Data::Dataset::Classic::Iris::get(as => 'Data::Table');
my ($train_dataset, $test_dataset) = SplitDataSetTrainAndTest($iris, 'species');

sub SplitDataSetTrainAndTest($dataset, $column_name) {
 my $rows_for_test = [];
 $dataset->each_group([$column_name], sub {
   my ($group_table, $rows_id) = @_;
   push @$rows_for_test, $rows_id->[0];
 });
 my $test_dataset = $dataset->subTable($rows_for_test);
 $dataset->delRows($rows_for_test);
 return ($dataset, $test_dataset);
}
```
___

¿Cómo se si hay problemas?

Diferencia en indicadores de error en los conjuntos de entrenamiento y validación

---

### Bibliotecas

---

### Deep Learning

___

#### MxNet

[MxNet](http://mxnet.io/)

[AI::MXNet](https://metacpan.org/pod/AI::MXNet)

___


#### Tensor Flow

[TensorFlow](https://www.tensorflow.org/)

<!-- .element: class="fragment" -->No hay wrapper en Perl...

<!-- .element: class="fragment" -->¿Voluntarios?

---

### Gradient Boosting

[XGBoost](https://xgboost.readthedocs.io/en/latest/)

<!-- .element: class="fragment" -->¿Wrapper en Perl?

<!-- .element: class="fragment" -->¡Lo hacemos!

___

#### Native Call

```execute_perl
examples/xgboost/native_call.pl
```
___

#### CPAN

[AI::XGBoost](https://metacpan.org/pod/AI::XGBoost)

___

#### ¿Cómo lo uso?

```execute_perl
examples/xgboost/xgboost.pl
```
---

<img src="https://spamassassin.apache.org/images/spamassassin-logobar.png" style="border:0px;background:rgba(255,255,255,0);">

### SpamAssassin

Filtrando e-mail mediante un filtro bayesiano desde 2001!

[https://spamassassin.apache.org/](https://spamassassin.apache.org/)

MetaCPAN: [Mail::SpamAssassin](https://metacpan.org/pod/Mail::SpamAssassin)

[Artículo con la descripción del algoritmo](http://radio.weblogs.com/0101454/stories/2002/09/16/spamDetection.html)

---

### Modulos en Perl

* Habitualmente en AI::*
* Wrappers de librerías

___

* [LIBSVM](https://metacpan.org/pod/Alien::LIBSVM): SVM
* [NaiveBayes](https://metacpan.org/pod/AI::NaiveBayes): Naive Bayes

---

## Conclusión

* Usar Machine Learning no es tan difícil

* Perl tiene todos elementos necesarios

* ¿Más fácil? ¡Haz un módulo!


