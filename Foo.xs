#include "EXTERN.h"
#include "perl.h"
#include "XSUB.h"

#include "ppport.h"

#include "Foo.h"

MODULE = Foo PACKAGE = Foo		

PROTOTYPES: DISABLED

FooContext*
Foo::new()
    PREINIT:
        FooContext* ctx;
    CODE:
        Newx(ctx, 1, FooContext);
        ctx->val = 0;
        RETVAL=ctx;
    OUTPUT:
        RETVAL

void
DESTROY(FooContext* ctx)
    CODE:
        free(ctx);

void
add(FooContext* ctx, int val)
    CODE:
        ctx->val += val;

int
val(FooContext* ctx)
    CODE:
        RETVAL = ctx->val;
    OUTPUT:
        RETVAL

