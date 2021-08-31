# Evil Eval PHP 8 
PHP extension to disable the `eval` language construct in PHP8

## Reasons
I got sick of hackers and others who trying to execute different PHP shells
based on execution of eval. I can turn off dangerous functions through the php.ini,
but I can't turn off the `eval` using standard methods.

`Eval` function can't be disabled via the `disabled_functions` in INI setting,
because `eval` is not a function!

I haven't found Suhosin module for PHP 8.0 or any other solutions.
So I wrote an extension for this.

```php
eval('$i = 123');

// Result of execution
Fatal error: syntax error, unexpected token, expecting end of file in /www/index.php on line 3
```

Or, if disabled hide presence this extension
```php
eval('$i = 123');

// Result of execution
Fatal error: eval is not a function in /www/index.php on line 3
```

In PHP 8 no longer supports eval by:
1. preg_replace('/a/e', $_REQUEST['shell'], 'a') -> Warning: preg_replace(): The /e modifier is no longer supported, use preg_replace_callback instead
2. mb_ereg_replace('a', $_REQUEST['shell'], 'a', 'e'); -> Fatal error: Uncaught ValueError: Option "e" is not supported 
3. create_function -> Fatal error: Uncaught Error: Call to undefined function create_function()

And now with my extension, you can disable `eval`

![Disable eval in PHP8 Screenshot](https://raw.githubusercontent.com/frontdevops/php-evil/main/assets/img1.png)

Or

![Disable eval in PHP8 Screenshot](https://raw.githubusercontent.com/frontdevops/php-evil/main/assets/img2.png)


## Versions
- Works for PHP8.
- Tested in PHP 8.0.8 on my production server and it works well.
  Possibly more versions, but I haven't explicitly tested it.


## Build instructions
1. `git clone https://github.com/frontdevops/php-evil`
2. `cd php-evil`
3. `phpize`
4. `./configure` or `./configure --enable-hide-presence` (whether to hide presence this extension)
5. `make && make install`
6. Add to php.ini `extension=evil.so`


## Build in Docker
```docker
FROM php:8.0-fpm


RUN git clone https://github.com/frontdevops/php-evil && \
    cd php-evil && \
    phpize && ./configure --enable-hide-presence && \
    make && make install && \
    echo "extension=evil.so" > /usr/local/etc/php/conf.d/evil.ini && \
    cd .. && \
    rm -rf php-evil

```


## License
### My Standard Open Source License
1. As it is
2. No guarantees that any of this works anymore
3. I will not be responsible for your code and do not guarantee
   that everything works as it should on your server.
4. Other in [No license text](https://github.com/frontdevops/php-evil/blob/main/LICENSE)


## Feedback and supports
If you have any suggestions, create a pull request.

