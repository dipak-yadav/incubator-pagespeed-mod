serf_build_rule = """

cc_library(
    name = "serf",
    srcs = [
        "auth/auth.c",
        "auth/auth_basic.c",
        "auth/auth_digest.c",
        "auth/auth_spnego.c",
        "auth/auth_spnego_gss.c",
        "auth/auth_spnego_sspi.c",
        "buckets/aggregate_buckets.c",
        # XXX(oschaaf): the gyp has this, but wouldn't it violate the ODR?
        #"buckets/allocator.c", 
        "buckets/barrier_buckets.c",
        "buckets/chunk_buckets.c",
        "buckets/dechunk_buckets.c",
        "buckets/deflate_buckets.c",
        "buckets/file_buckets.c",
        "buckets/headers_buckets.c",
        "buckets/iovec_buckets.c",
        "buckets/limit_buckets.c",
        "buckets/mmap_buckets.c",
        "buckets/request_buckets.c",
        "buckets/response_body_buckets.c",
        "buckets/simple_buckets.c",
        "buckets/socket_buckets.c",
        "context.c",
        "incoming.c",
        "ssltunnel.c",
        "@mod_pagespeed//third_party/serf:serf_pagespeed",
    ],
    hdrs = [
        "serf.h",
        "serf_private.h",
        "serf_bucket_types.h",
        "serf_bucket_util.h",
        "auth/auth.h",
        "auth/auth_spnego.h",
    ],
    copts = [
        "-Iexternal/aprutil/include/",
        "-Iexternal/aprutil/include/private/",
        "-Iexternal/aprutil/include/arch/unix/",
        "-Iexternal/aprutil/",
        "-Iexternal/mod_pagespeed/third_party/aprutil/gen/arch/linux/x64/include/",
        "-Iexternal/mod_pagespeed/third_party/apr/gen/arch/linux/x64/include/",
        "-Iexternal/apr/include/",
        "-Iexternal/apr/include/arch/unix/",
        "-Iexternal/apr/",
        "-Iexternal/serf/include/",
        "-Iexternal/serf/",
    ],
    visibility = ["//visibility:public"],
    deps = [
        "@apr",
        "@aprutil",
        "@boringssl//:ssl"
    ],
)
"""
