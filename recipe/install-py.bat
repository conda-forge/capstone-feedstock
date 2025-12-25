@echo on
cd bindings/python
:: stops build from rebuilding library and vendoring it in site-packages; see
:: https://github.com/capstone-engine/capstone/blob/5.0.6/bindings/python/setup.py#L166
:: at runtime, we use a different mechanism to find the library (see patches)
set LIBCAPSTONE_PATH=some_value
python setup.py install
