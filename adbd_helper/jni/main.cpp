#include <unistd.h>

int main(int argc, char** argv) {
    const char* real_adbd = "/apex/com.android.adbd/bin/adbd.real";

    char* const envp[] = {
        const_cast<char*>("LD_PRELOAD=/system/lib64/libadb_root_helper.so"),
    };

    return execve(real_adbd, argv, envp);
}