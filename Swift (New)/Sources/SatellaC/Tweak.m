#import <Orion/Orion.h>

__attribute__((constructor)) static void init() {
    orion_init();
}