# Excalibur: A web interface to extract tabular data from PDFs



[![Documentation Status](https://camo.githubusercontent.com/a9b179c0cbb8af4fa07d0ffb4416a11fac7c21f988cce3db1f18b0501b57ee9b/68747470733a2f2f72656164746865646f63732e6f72672f70726f6a656374732f657863616c696275722d70792f62616467652f3f76657273696f6e3d6d6173746572)](https://excalibur-py.readthedocs.io/en/master/) [![image](https://camo.githubusercontent.com/7faf7dc27456e06d3ea29317f8a0f398031a9029d3893213af408f7d63577d73/68747470733a2f2f696d672e736869656c64732e696f2f707970692f762f657863616c696275722d70792e737667)](https://pypi.org/project/excalibur-py/) [![image](https://camo.githubusercontent.com/f5c50ec37e938c2dbfe1172436ff961dbe10ff26fcc8dd0d2348b70f6aa98656/68747470733a2f2f696d672e736869656c64732e696f2f707970692f6c2f657863616c696275722d70792e737667)](https://pypi.org/project/excalibur-py/) [![image](https://camo.githubusercontent.com/a09986674e5bf3c40f45f2fad8fe7fd21fd9dcd279c3de31a52d4da6de92e4e9/68747470733a2f2f696d672e736869656c64732e696f2f707970692f707976657273696f6e732f657863616c696275722d70792e737667)](https://pypi.org/project/excalibur-py/) [![Gitter chat](https://camo.githubusercontent.com/5cf81fa80995ea959be1d42ed268a6874ea0e1474820c597ce8ac237707ab5b8/68747470733a2f2f6261646765732e6769747465722e696d2f63616d656c6f742d6465762f4c6f6262792e706e67)](https://gitter.im/camelot-dev/Lobby) [![image](https://camo.githubusercontent.com/5bf9e9fa18966df7cb5fac7715bef6b72df15e01a6efa9d616c83f9fcb527fe2/68747470733a2f2f696d672e736869656c64732e696f2f62616467652f636f64652532307374796c652d626c61636b2d3030303030302e737667)](https://github.com/ambv/black) [![image](https://camo.githubusercontent.com/f30d1d2b7429bf5d0563c57388fbfc058d12c8cbee15b45bd19b15bc802e7acd/68747470733a2f2f696d672e736869656c64732e696f2f62616467652f636f6e74696e6f75732532307175616c6974792d64656570736f757263652d6c6967687467726579)](https://deepsource.io/gh/camelot-dev/excalibur/?ref=repository-badge)

**Excalibur** is a web interface to extract tabular data from PDFs, written in **Python 3**! It is powered by [Camelot](https://camelot-py.readthedocs.io/).

**Note:** Excalibur only works with text-based PDFs and not scanned documents. (As Tabula [explains](https://github.com/tabulapdf/tabula#why-tabula), "If you can click and drag to select text in your table in a PDF viewer, then your PDF is text-based".)

## Using Excalibur



**Note:** You need to [install ghostscript](https://camelot-py.readthedocs.io/en/master/user/install-deps.html) before moving forward.

After [installing Excalibur with pip](https://excalibur-py.readthedocs.io/en/master/user/install.html), you need to initialize the metadata database using:

```
$ excalibur initdb
```

And then start the webserver using:

```
$ excalibur webserver
```

That's it! Now you can go to [http://localhost:5000](http://localhost:5000/) and start extracting tabular data from your PDFs.

1. **Upload** a PDF and enter the page numbers you want to extract tables from.

2. Go to each page and select the table by drawing a box around it. (You can choose to skip this step since Excalibur can automatically detect tables on its own. Click on "**Autodetect tables**" to see what Excalibur sees.)

3. Choose a flavor (Lattice or Stream) from "**Advanced**".

   a. **Lattice**: For tables formed with lines.

   b. **Stream**: For tables formed with whitespaces.

4. Click on "**View and download data**" to see the extracted tables.

5. Select your favorite format (CSV/Excel/JSON/HTML) and click on "**Download**"!

**Note:** You can also download executables for Windows and Linux from the [releases page](https://github.com/camelot-dev/excalibur/releases) and run them directly!

[![usage.gif](https://camo.githubusercontent.com/8f581fbb974a773dbe71eee49a2b5059d360614b841c63ccdab50d6c0668cf81/68747470733a2f2f657863616c696275722d70792e72656164746865646f63732e696f2f656e2f6d61737465722f5f696d616765732f75736167652e676966)](https://camo.githubusercontent.com/8f581fbb974a773dbe71eee49a2b5059d360614b841c63ccdab50d6c0668cf81/68747470733a2f2f657863616c696275722d70792e72656164746865646f63732e696f2f656e2f6d61737465722f5f696d616765732f75736167652e676966)

## Why Excalibur?



- Extracting tables from PDFs is hard. A simple copy-and-paste from a PDF into an Excel doesn't preserve table structure. **Excalibur makes PDF table extraction very easy**, by automatically detecting tables in PDFs and letting you save them into CSVs and Excel files.
- Excalibur uses [Camelot](https://camelot-py.readthedocs.io/) under the hood, which gives you additional settings to tweak table extraction and get the best results. You can see how it performs better than other open-source tools and libraries [in this comparison](https://github.com/socialcopsdev/camelot/wiki/Comparison-with-other-PDF-Table-Extraction-libraries-and-tools).
- You can save table extraction [settings](https://excalibur-py.readthedocs.io/en/master/user/faq.html#faq) (like table areas) for a PDF once, and apply them on new PDFs to extract tables with similar structures.
- You get complete control over your data. All file storage and processing happens on your own local or remote machine.
- Excalibur can be configured with MySQL and Celery for parallel and distributed workloads. By default, sqlite and multiprocessing are used for sequential workloads.

## Installation



### Using pip



After installing [ghostscript](https://www.ghostscript.com/), which is one of the requirements for Camelot (See [install instructions](https://camelot-py.readthedocs.io/en/master/user/install-deps.html)), you can simply use pip to install Excalibur:

```
$ pip install excalibur-py
```

### From the source code



After installing ghostscript, clone the repo using:

```
$ git clone https://www.github.com/camelot-dev/excalibur
```

and install Excalibur using pip:

```
$ cd excalibur
$ pip install .
```

## Documentation



Fantastic documentation is available at http://excalibur-py.readthedocs.io/.

## Development



The [Contributor's Guide](https://excalibur-py.readthedocs.io/en/master/dev/contributing.html) has detailed information about contributing code, documentation, tests and more. We've included some basic information in this README.

### Source code



You can check the latest sources with:

```
$ git clone https://www.github.com/camelot-dev/excalibur
```

### Setting up a development environment



You can install the development dependencies easily, using pip:

```
$ pip install excalibur-py[dev]
```

### Testing (soon)



After installation, you can run tests using:

```
$ python setup.py test
```

## Versioning



Excalibur uses [Semantic Versioning](https://semver.org/). For the available versions, see the tags on this repository. For the changelog, you can check out [HISTORY.md](https://github.com/camelot-dev/excalibur/blob/master/HISTORY.md).

## License



This project is licensed under the MIT License, see the [LICENSE](https://github.com/camelot-dev/excalibur/blob/master/LICENSE) file for details.

## Support the development



You can support our work on Excalibur with a one-time or monthly donation [on OpenCollective](https://opencollective.com/excalibur). Organizations who use Excalibur can also sponsor the project for an acknowledgement on [our official site](https://www.tryexcalibur.com/) and this README.

Special thanks to all the users and organizations that support Excalibur!