#include "EXTERN.h"
#include "perl.h"
#include "XSUB.h"

#include "ppport.h"

#include "Foo.h"


MODULE = Foo PACKAGE = Foo		

PROTOTYPES: DISABLED

void
_create_foo_context(SV *sv)
    PREINIT:
        FooContext* ctx;
    CODE:
        ctx = (FooContext*) malloc(sizeof(FooContext));
        ctx->val = 0;
        sv_magic(SvRV(sv), NULL, PERL_MAGIC_ext, NULL, 0);
        mg_find(SvRV(sv), PERL_MAGIC_ext)->mg_obj = (void *) ctx;

void
_destroy_foo_context(FooContext* ctx)
    CODE:
        free(ctx);

void
_foo_add(SV* sv, SV* svval)
    PREINIT:
        FooContext* ctx;
        int val;
    CODE:
        ctx = (FooContext*) mg_find(SvRV(sv), PERL_MAGIC_ext)->mg_obj;
        if (ctx) ctx->val += SvIV(svval);

int
_foo_val(SV*sv)
    PREINIT:
        FooContext* ctx;
    CODE:
        ctx = (FooContext*) mg_find(SvRV(sv), PERL_MAGIC_ext)->mg_obj;
        RETVAL = ctx->val;
    OUTPUT:
        RETVAL
