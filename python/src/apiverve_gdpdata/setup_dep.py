from setuptools import setup, find_packages

setup(
    name='apiverve_gdpdata',
    version='1.2.5',
    packages=find_packages(),
    include_package_data=True,
    install_requires=[
        'requests',
        'setuptools'
    ],
    description='Get GDP (Gross Domestic Product) data for any country including current values and historical data going back to 1960. With changes=true it also returns the direction against the previous year, and on paid plans the prior year's GDP, the dollar and percent change, whether real growth is accelerating or slowing, and 5- and 10-year compound annual growth.',
    author='APIVerve',
    author_email='hello@apiverve.com',
    url='https://apiverve.com/marketplace/gdp?utm_source=pypi&utm_medium=referral&utm_content=homepage',
    classifiers=[
        'Programming Language :: Python :: 3',
        'Operating System :: OS Independent',
    ],
    python_requires='>=3.6',
)
