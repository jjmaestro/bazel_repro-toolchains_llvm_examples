"""
Helpers to e2e test outside repo
"""

def build_test(name):
    """
    Helper macro to e2e test outside repo
    """
    target = "@repro-toolchains_llvm_examples//src:%s" % name

    native.genrule(
        name = name,
        srcs = [target],
        outs = ["%s.files" % name],
        cmd = """
        echo "$(locations {target})" >| $@
        """.format(
            target = target,
        ),
        testonly = True,
        visibility = ["//visibility:public"],
    )
