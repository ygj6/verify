#include <stdio.h>
#include <openssl/ssl.h>
#include <openssl/err.h>

int main()
{
	unsigned long a;
	SSL_library_init();
	ERR_load_crypto_strings();
	SSL_load_error_strings();
	OpenSSL_add_all_algorithms();

	a = SSLeay();
	printf("SSLeay = %1x\n", a);
	printf("OPENSSL_VERSION_NUMBER = %1x\n", OPENSSL_VERSION_NUMBER);

	printf("---end---\n");
	return !(a == OPENSSL_VERSION_NUMBER); 
}
