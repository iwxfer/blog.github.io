tags: jekyll blog github-page

# Kotlin Lazy

https://www.baeldung.com/kotlin-lazy-initialization


```java
@Test
fun givenLazyValue_whenGetIt_thenShouldInitializeItOnlyOnce() {
    // given
    val numberOfInitializations: AtomicInteger = AtomicInteger()
    val lazyValue: ClassWithHeavyInitialization by lazy {
        numberOfInitializations.incrementAndGet()
        ClassWithHeavyInitialization()
    }
    // when
    println(lazyValue)
    println(lazyValue)
 
    // then
    assertEquals(numberOfInitializations.get(), 1)
}
```